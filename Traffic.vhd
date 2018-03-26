----------------------------------------------------------------------------------------
-- College: IIT Roorkee
-- Student: Tarun Kumar
-- Enrollment No: 14114068
--
-- Create Date: 31.03.2015 22:56:25		::::::::::::::::::::	::::    ::::
-- Design Name: Traffic Light Controller	::::::::::::::::::::	::::   ::::
-- Module Name: main - Behavioral			::::		::::  ::::
-- Project Name: Traffic Light Controller		::::		:::: :::: 
-- Subject: EC-104					::::		::::::::
-- 							::::		:::: ::::
-- Dependencies: NIL					::::		::::   ::::
-- 							::::		::::    ::::
-- Revision: Traffic Light Controller			::::		::::	 ::::
-- 
-----------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port ( 	
		clk : in std_logic; --- Clock with provided frequency
		g1 : out std_logic; --
		y1 : out std_logic; --- Outputs for fist side
		r1 : out std_logic; --
		g2 : out std_logic; --
		y2 : out std_logic; --- Outputs for second side
		r2 : out std_logic; --
		g3 : out std_logic; --
		y3 : out std_logic; --- Outputs for third side
		r3 : out std_logic; --
		g4 : out std_logic; --
		y4 : out std_logic; --- Outputs for fourth side
		r4 : out std_logic);
end main;

architecture Traffic of main is
	signal count : integer := 0;
	signal a: std_logic_VECTOR (11 downto 0) := "010100100100" ;
	begin PROCESS (clk)   
        	BEGIN case count is -- Cases and their corresponding signal variations.
                	when 0 => a <= "010100100100"; count <= count+1;
                	when 5 => a <= "001100100100";  count <= count+1;
                	when 40 => a <= "100010100100";  count <= count+1;
                	when 45 => a <= "100001100100"; count <= count+1;
                	when 80 => a <= "100100010100"; count <= count+1;
                	when 85 => a <= "100100001100"; count <= count+1;
                	when 120 => a <= "100100100010"; count <= count+1;
                	when 125 => a <= "100100100001"; count <= count+1;
                	when 160 => a <= "010100100100"; count <= 0;
			when others => count <= count+1;
         	END case;
	r1 <= a(2);	y1 <= a(1);	g1 <= a(0);
	r2 <= a(5);	y2 <= a(4);	g2 <= a(3); -- Assigning all signals their corresponding values.
	r3 <= a(8);	y3 <= a(7);	g3 <= a(6);
	r4 <= a(11);	y4 <= a(10);	g4 <= a(9);
	END PROCESS; 
end Traffic;