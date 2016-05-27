-------------------------------------------------------------------------------
-- Entity: fmc_chn
-- Author: Waj
-------------------------------------------------------------------------------
-- Description:
-- Floppy-Music Controller (1 channel)
-------------------------------------------------------------------------------
-- Total # of FFs: ... tbd ...
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mcu_pkg.all;

entity fmc_chn is
  generic(N : natural := 0 -- channel number
          ); 
  port(rst     : in std_logic;
       clk     : in std_logic;
       -- control inputs
       tick_dur : in std_logic; -- nominal period = 1 ms
       tick_nco : in std_logic; -- nominal period = 1 us
       chn_enb  : in std_logic;
       -- outputs to pins
       fmc_enb : out std_logic;
       fmc_dir : out std_logic;
       fmc_stp : out std_logic
       );
end fmc_chn;

architecture rtl of fmc_chn is

  -- ROM and addressing
  signal rom_addr : std_logic_vector(FMC_ROM_AW-1 downto 0);
  signal rom_data : std_logic_vector(FMC_ROM_DW-1 downto 0);
  signal duration_cnt, tone_duration: unsigned(FMC_DUR_WW-1 downto 0);
  signal tone_number : std_logic_vector(FMC_TON_WW-1 downto 0);
  signal tone_end_evt : std_logic;
  -- LUT: tone number ==> NCO seed
  type t_nco_lut is array (2**FMC_TON_WW-1 downto 0) of natural;
  constant nco_lut : t_nco_lut := (
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,7382,6968,6577,6207,5859,5530,5220,4927,4650,4389,4143,3910,3691,
    3484,3288,3104,2930,2765,2610,2463,2325,2195,2071,1955,1845,1742,1644,1552,1465,1383,1305,1232,
    1163,1097,1036,978,923,871,822,776,732,691,652,616,581,549,518,489,461,0);
  -- NCO signals
  signal seed    : unsigned(12 downto 0); -- 13 bit seed
  signal nco_reg : unsigned(23 downto 0); -- 24 bit NCO
  -- Step Counter
  signal stp_ctr : unsigned(6 downto 0);  --  7 bit step counter
  signal stp_old : std_logic;             --  1 bit old step memory
  signal fmc_stp_tmp : std_logic;         --  1 bit to read the step output internally
  signal fmc_dir_tmp : std_logic;         --  1 bit to read the direction output internally
  
begin

  -- concurrent assignments
  fmc_stp <= fmc_stp_tmp;
  fmc_dir <= fmc_dir_tmp;
  fmc_enb <= '0' when unsigned(tone_number) = 0 else '1';
  
-- dummy!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--fmc_enb <= tone_duration(0);
  fmc_stp_tmp <= std_logic(nco_reg(nco_reg'left)); -- MSB of NCO is desired frequency

  -----------------------------------------------------------------------------
  -- ROM addressing and tick counting
  -----------------------------------------------------------------------------  
  P_read: process(rst, clk)
  begin
    if rst = '1' then
      duration_cnt <= (others => '0');
      tone_end_evt <= '0';
      rom_addr     <= (others => '0');
    elsif rising_edge(clk) then
      -- maintain tone duration counter
      if tick_dur = '1' then
        if duration_cnt = tone_duration then
          duration_cnt <= (others => '0');
          tone_end_evt <= '1';
        else
          duration_cnt <= duration_cnt + 1;
        end if;
      end if;
      -- maintain ROM address
      if chn_enb = '0' then
        rom_addr <= (others => '0');
      elsif tone_end_evt = '1' then
        if tone_duration = FMC_LAST_TONE then
          -- restart playing from 1st tone
          rom_addr <= (others => '0');
        else
          rom_addr <= std_logic_vector(unsigned(rom_addr)+1);
        end if;
      end if;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- channel number dependent FMC ROM instance
  -----------------------------------------------------------------------------  
  rom : entity work.fmc_rom
    generic map(N => N)
    port map (clk  => clk,
              addr => rom_addr,
              data => rom_data
              );
  tone_duration <= unsigned(rom_data(FMC_DUR_WW+FMC_TON_WW-1 downto FMC_TON_WW));
  tone_number   <= rom_data(FMC_TON_WW-1 downto 0);
    
  -----------------------------------------------------------------------------
  -- NCO (tone frequency generation)
  -----------------------------------------------------------------------------  
  P_nco: process(rst, clk)
  begin
    if rst = '1' then
      seed    <= (others => '0');
      nco_reg <= (others => '0');
    elsif rising_edge(clk) then
      seed    <= to_unsigned(nco_lut(to_integer(unsigned(tone_number))),13);
      nco_reg <= nco_reg + seed;
    end if;
  end process;
  
  P_dir_gen: process(rst, clk)
  begin
    if rst = '1' then
      stp_ctr <= (others => '0');
		stp_old <= '0';
		fmc_dir_tmp <= '0';
    elsif rising_edge(clk) then
	    -- update and check step status
	    stp_old <= fmc_stp_tmp;
      if stp_old /= fmc_stp_tmp then
		    stp_ctr <= stp_ctr + 1;
	    end if;
	    -- check step count
      if stp_ctr >= 80 then
		    stp_ctr <= (others => '0');
		    fmc_dir_tmp <= not fmc_dir_tmp;
		  end if;
	  end if;
  end process;

end rtl;
