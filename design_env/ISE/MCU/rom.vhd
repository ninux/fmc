-------------------------------------------------------------------------------
-- Entity: rom
-- Author: Waj
-- Date  : 11-May-13, 26-May-13
-------------------------------------------------------------------------------
-- Description: (ECS Uebung 9)
-- Program memory for simple von-Neumann MCU with registerd read data output.
-------------------------------------------------------------------------------
-- Total # of FFs: DW
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mcu_pkg.all;

entity rom is
  port(clk     : in    std_logic;
       -- ROM bus signals
       bus_in  : in  t_bus2ros;
       bus_out : out t_ros2bus
       );
end rom;

architecture rtl of rom is

  type t_rom is array (0 to 2**AWL-1) of std_logic_vector(DW-1 downto 0);
  constant rom_table : t_rom := (
    ---------------------------------------------------------------------------
    -- program code -----------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Opcode    Rdest    Rsrc1    Rsrc2               description
    ---------------------------------------------------------------------------
    -- initialize FMC module - configure channels
	OPC(setil) & reg(3) & n2slv(16#FF#, DW/2),         -- setil r3, 0xFF (enable all FMC channels)
	OPC(setil) & reg(4) & n2slv(16#40#, DW/2),         -- setil r4, 0x40 (set low byte of config address)
   OPC(setih) & reg(4) & n2slv(16#03#, DW/2),         -- setih r4, 0x03 (set high byte of config address)		
	OPC(st)    & reg(3) & reg(4) & "-----",            -- FMC_CHN_ENB = 0xFF
	-- initialize FMC module - configure speed factor
	OPC(setil) & reg(3) & n2slv(16#04#, DW/2),         -- setil r3, 0x04
	OPC(setih) & reg(3) & n2slv(16#00#, DW/2),         -- setih r3, 0x00
	OPC(setil) & reg(4) & n2slv(16#41#, DW/2),         -- setil r4, 0x41
	OPC(setih) & reg(4) & n2slv(16#03#, DW/2),         -- setih r4, 0x03
	OPC(st)    & reg(3) & reg(4) & "-----",            -- SPD_FAC = 0x0400
	-- ROT_ENC module - Prepare Ctrl to set capture flag
   OPC(setil) & reg(0) & n2slv(16#01#, DW/2),         -- setil r0, 0x01
   OPC(setih) & reg(0) & n2slv(16#00#, DW/2),         -- setih r0, 0x00
   -- ROT_ENC module - Prepare ctrl address
   OPC(setil) & reg(1) & n2slv(16#03#, DW/2),         -- setil r1, 0x03
   OPC(setih) & reg(1) & n2slv(16#03#, DW/2),         -- setih r1, 0x30
   -- ROT_ENC module - Prepare counter address
   OPC(setil) & reg(2) & n2slv(16#04#, DW/2),         -- setil r2, 0x04
   OPC(setih) & reg(2) & n2slv(16#03#, DW/2),         -- setih r2, 0x30
	-- addr 0x00F: start of end-less loop
      -- set capture flag
      OPC(st)  & reg(0) & reg(1) & "-----",        -- st r0, r1
      -- read counter
      OPC(ld)  & reg(3) & reg(2) & "-----",        -- ld r3, r2
		-- shift 7 times - TODO maybe to much?
		OPC(slai) & reg(5) & reg(3) & "-----",        -- sla r5, r3 (r5 := (r3 << 1))
		OPC(slai) & reg(6) & reg(5) & "-----",        -- sla r6, r5
		OPC(slai) & reg(5) & reg(6) & "-----",        -- sla r5, r6
		OPC(slai) & reg(6) & reg(5) & "-----",        -- sla r6, r5
		OPC(slai) & reg(5) & reg(6) & "-----",        -- sla r5, r6
		OPC(slai) & reg(6) & reg(5) & "-----",        -- sla r6, r5
		OPC(slai) & reg(5) & reg(6) & "-----",        -- sla r5, r6		
		-- update speed factor FMC module
		OPC(mov)   & reg(4) & reg(5) & "-----",
   -- End of endless loop
   OPC(jmp)   & "-00" & n2slv(16#0F#, AW-2),             -- jmp 0x00F
   ---------------------------------------------------------------------------
   others => OPC(nop)  & "-----------"                   -- NOP
  );
  
begin

  -----------------------------------------------------------------------------
  -- sequential process: ROM table with registerd output
  -----------------------------------------------------------------------------  
  P_rom: process(clk)
  begin
    if rising_edge(clk) then
      bus_out.data <= rom_table(to_integer(unsigned(bus_in.addr)));
    end if;
  end process;
  
end rtl;
