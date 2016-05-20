-------------------------------------------------------------------------------
-- Company    :  HSLU
-- Engineer   :  Gai, Waj
-- 
-- Create Date:  05-Apr-11,
-- Project    :  RT Video Lab 1: Exercise 1
-- Description:  symmetrical 5-tap FIR filter in transposed form
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity fir_1d_trn_sym is
  generic
    (IN_DW   : integer := 8;            -- Input word width
     OUT_DW  : integer := 19;           -- Output word width
     COEF_DW : integer := 7;            -- coefficient word width
     TAPS    : integer := 5;            -- # of taps + 1 input register
     DELAY   : integer := 8);           -- output delay line
                                        -- (to adapt latency to system architecture)
  port
    (ce_1     : in  std_logic;          -- clock enable
     clk_1    : in  std_logic;          -- clock
     load     : in  std_logic;          -- load coeff pulse
     coef     : in  std_logic_vector(COEF_DW-1 downto 0);
     din      : in  std_logic_vector(IN_DW-1 downto 0);
     out_data : out std_logic_vector(OUT_DW-1 downto 0)
     );
end fir_1d_trn_sym;

architecture Behavioral of fir_1d_trn_sym is

  -- type declarations
  type STAGE_TYPE is array(TAPS-1 downto 0) of signed(OUT_DW-1 downto 0);
  type DELAY_TYPE is array(DELAY downto 0) of signed(IN_DW-1 downto 0);
  type COEFF_TYPE is array(TAPS-1 downto 0) of signed(COEF_DW-1 downto 0);

  -- signal declarations (init values for simulation only!!!)
  signal inreg    : signed(OUT_DW-COEF_DW-1 downto 0) := (others => '0');
  signal stage    : STAGE_TYPE := (others => (others => '0'));
  signal del_line : DELAY_TYPE := (others => (others => '0'));

  -- constant declarations
  constant C_coef : COEFF_TYPE := (to_signed(2, COEF_DW),   -- b4
                                   to_signed(4, COEF_DW),   -- b3
                                   to_signed(8, COEF_DW),   -- b2
                                   to_signed(0, COEF_DW),   -- b1 - not used!!
                                   to_signed(0, COEF_DW));  -- b0 - not used!! 

begin

  -- comb. output assignment (output register already from stage(0))
  out_data <= std_logic_vector(stage(0));

  -- sequential process (without reset, because SysGen uses FIR-Compiler without
  -- reset signal)
  p0_FIR : process(clk_1)
    type PROD_TYPE is array(TAPS-1 downto (TAPS-1)/2) of signed(OUT_DW-1 downto 0);
    variable v_prod : PROD_TYPE;
  begin
    if rising_edge(clk_1) then
      if ce_1 = '1' then
        -- input delay line
        del_line(DELAY)            <= signed(din);
        del_line(DELAY-1 downto 0) <= del_line(DELAY downto 1);
        -- register input sample
        inreg(OUT_DW-COEF_DW-1 downto IN_DW) <= (others => '0');
        inreg(IN_DW-1          downto 0)     <= del_line(0);
        -- compute products
        for k in TAPS-1 downto (TAPS-1)/2 loop
          v_prod(k) := inreg * C_coef(k);
        end loop;
        -- compute filter taps
        stage(TAPS-1) <= v_prod(TAPS-1);
        for k in TAPS-2 downto (TAPS-1)/2 loop
          stage(k) <= v_prod(k) + stage(k+1);
        end loop;
        for k in (TAPS-1)/2-1 downto 0 loop
          stage(k) <= v_prod(TAPS-1-k) + stage(k+1);
        end loop;
      end if;
    end if;
  end process;

end Behavioral;

