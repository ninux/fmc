-------------------------------------------------------------------------------
-- Entity: fmc_top
-- Author: Waj
-------------------------------------------------------------------------------
-- Description: (ECS Uebung 9)
-- Top-level of Floppy-Music Controller peripheral module in MCU.
-------------------------------------------------------------------------------
-- Total # of FFs: ... tbd ...
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mcu_pkg.all;

entity fmc_top is
  port(rst     : in    std_logic;
       clk     : in    std_logic;
       -- FMC bus signals
       bus_in  : in  t_bus2rws;
       bus_out : out t_rws2bus;
       -- FMC pin signals
       fmc_enable : out  std_logic_vector(FMC_NUM_CHN-1 downto 0);
       fmc_direct : out  std_logic_vector(FMC_NUM_CHN-1 downto 0);
       fmc_step   : out  std_logic_vector(FMC_NUM_CHN-1 downto 0)
       );
end fmc_top;

architecture rtl of fmc_top is

  -- address select signal
  signal addr_sel : t_fmc_addr_sel;
  -- peripheral registers
  signal chn_enb_reg  : std_logic_vector(FMC_NUM_CHN-1 downto 0);
  signal tmp_ctrl_reg : std_logic_vector(9 downto 0);
  -- prescaler signals
  signal tick_dur_cnt: unsigned(19 downto 0);	-- counter for duration generation
  signal tick_nco_cnt: unsigned(5 downto 0);	-- counter for nco generation
  --signal speed_factor : unsigned(9 downto 0); -- speed factor
  signal tick_dur : std_logic;				-- divided down clock for tone duration nominal 1kHz
  signal tick_nco : std_logic;				-- divided down clock for NCO nominal 1MHz
  constant duration_end_time : integer := 50000 -1;
  constant nco_end_time : integer:=50 -1;
  
begin

  -----------------------------------------------------------------------------
  -- Address Decoding (combinationally)
  -----------------------------------------------------------------------------  
  process(bus_in.addr)
  begin
    case bus_in.addr is
      -- FMC addresses --------------------------------------------------------
      when c_addr_fmc_chn_enb  => addr_sel <= fmc_chn_enb;
      when c_addr_fmc_tmp_ctrl => addr_sel <= fmc_tmp_ctrl;
      -- unused addresses -----------------------------------------------------
      when others              => addr_sel <= none;
    end case;       
  end process;

  -----------------------------------------------------------------------------
  -- Read Access (R and R/W registers)
  -----------------------------------------------------------------------------  
  P_read: process(clk)
  begin
    if rising_edge(clk) then
      -- default assignment
      bus_out.data <= (others => '0');
      -- use address select signal
      case addr_sel is
        when fmc_chn_enb  => bus_out.data(FMC_NUM_CHN-1 downto 0) <= chn_enb_reg;
        when fmc_tmp_ctrl => bus_out.data(            9 downto 0) <= tmp_ctrl_reg;
        when others        => null;
      end case;       
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Write Access (R/W regsiters only)
  -----------------------------------------------------------------------------  
  P_write: process(clk, rst)
  begin
    if rst = '1' then
      chn_enb_reg  <= (others => '0');
      tmp_ctrl_reg <= (others => '0');
    elsif rising_edge(clk) then
      if bus_in.wr_enb = '1' then
        -- use address select signal
        case addr_sel is
          when fmc_chn_enb  => chn_enb_reg  <= bus_in.data(FMC_NUM_CHN-1 downto 0);
          when fmc_tmp_ctrl => tmp_ctrl_reg <= bus_in.data(            9 downto 0);
          when others       => null;
        end case;       
      end if;
    end if;
  end process;


  -----------------------------------------------------------------------------
  -- Instantiation of FMC channels
  -----------------------------------------------------------------------------  
  fmc_i: for i in 0 to FMC_NUM_CHN-1 generate
    fmc_chn_i : entity work.fmc_chn
      generic map(N => i)
      port map (rst      => rst,
                clk      => clk,
                tick_dur => tick_dur,
                tick_nco => tick_nco,
                chn_enb  => chn_enb_reg(i),
                fmc_enb  => fmc_enable(i),
                fmc_dir  => fmc_direct(i),
                fmc_stp  => fmc_step(i)
               );
  end generate;
  
  -----------------------------------------------------------
  -- Generates divided down clock signals
  -----------------------------------------------------------
  P_clock_generator: process(rst, clk)
  begin
    if rst = '1' then
		tick_dur_cnt <= (others=>'0');
		tick_nco_cnt <= (others=>'0');
		tick_dur 	<= '0';
		tick_nco		<= '0';
    elsif rising_edge(clk) then
	   tick_dur_cnt <= tick_dur_cnt + 1;
	   tick_nco_cnt <= tick_nco_cnt + 1;
		tick_dur <= '0';
		tick_nco <= '0';
	   if tick_dur_cnt = duration_end_time then
--		  if tick_dur = '1' then
--			tick_dur <= '0';		-- 1kHz clock edge
--		  else	
--			tick_dur <= '1';		-- 1kHz clock edge
--		  end if;
			tick_dur <= '1';
			tick_dur_cnt <= (others=>'0'); -- reset counter
	   end if;
	  
	   if tick_nco_cnt = nco_end_time then
--		  if tick_nco = '1' then
--			tick_nco <= '0';		-- 1MHz clock edge
--		  else	
--			tick_nco <= '1';		-- 1MHz clock edge
--		  end if;
			tick_nco <= '1';
		  tick_nco_cnt <= (others=>'0');	-- reset counter
	  end if;
	   end if;
  end process;

end rtl;
