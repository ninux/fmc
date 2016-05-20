----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:14:58 05/13/2016 
-- Design Name: 
-- Module Name:    fmc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fmc is
	port(	rst			: in		std_logic;
			clk				: in		std_logic;
			-- FMC bus signals
			bus_in		: in		t_bus2rws;
			bus_out		: out		t_rws2bus;
			-- FMC pin signals
			fmc_step		: out		std_logic_vector(N_FMC-1 downto 0);
			fmc_dir		: out		std_logic_vector(N_FMC-1 downto 0);
			fmc_enb		: out		std_logic_vector(N_FMC-1 downto 0)
	);
end fmc;

architecture Behavioral of fmc is

	-- address select signal
	
	-- peripheral registers
	signal fmc_enb_reg	: std_logic_vector(N_FMC-1 downto 0);
	signal fmc_spd_reg	: std_logic_vector(N_FMC_SPD-1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Address Decoding (combinationally)
  -----------------------------------------------------------------------------  
  process(bus_in.addr)
  begin
    case bus_in.addr is
      -- Port 1 addresses -----------------------------------------------------
      when c_addr_fmc_chn_enb  => addr_sel <= fmc_chn_enb;
      when c_addr_fmc_tmp_ctrl => addr_sel <= fmc_tmp_ctrl;
      -- unused addresses -----------------------------------------------------
      when others               => addr_sel <= none;
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
        when fmc_chn_enb  => bus_out.data <= fmc_enb_reg;
        when fmc_tmp_ctrl => bus_out.data <= fmc_spd_reg;
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
      data_out_reg <= (others => '0');
      out_enb_reg  <= (others => '0');  -- output disabled per default
    elsif rising_edge(clk) then
      if bus_in.wr_enb = '1' then
        -- use address select signal
        case addr_sel is
          when fmc_chn_enb	=> fmc_enb_reg	<= bus_in.data;
          when fmc_tmp_ctrl => fmc_spd_reg	<= bus_in.data;
          when others       => null;
        end case;       
      end if;
    end if;
  end process;

end Behavioral;