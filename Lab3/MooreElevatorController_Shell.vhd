----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva/Leaf
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		CE3
-- Module Name:    	MooreElevatorController_Shell - Behavioral 
-- Description: 		Shell for completing CE3
--with updated changes to complete the lab 3
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

entity MooreElevatorController_Shell is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           --stop : in  STD_LOGIC;
           --up_down : in  STD_LOGIC;
			  floorSelector : in STD_LOGIC_VECTOR (2 downto 0);
           floor : out  STD_LOGIC_VECTOR (4 downto 0));
end MooreElevatorController_Shell;

architecture Behavioral of MooreElevatorController_Shell  is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type floor_state_type is (floor0, floor1, floor2, floor3, floor4, floor5, floor6, floor7);

--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal floor_state : floor_state_type;
signal stop : STD_LOGIC;
signal up_down : STD_LOGIC;--changed to signal to use in inputting floor number with switches
signal signalFloor : STD_LOGIC_VECTOR (4 downto 0);--signal for handling the floor number

begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
floor_state_machine: process(clk)
begin

if (floorSelector > signalFloor and floorSelector <= "0111") then ---if the floor is greatert han teh current it goes up
			up_down <= '1';
			stop <= '0';
		elsif (floorSelector< signalFloor) then --otherwise it goes down
			up_down <= '0';
			stop <= '0';
		else 
			stop <= '1';
			end if;
	--clk'event and clk='1' is VHDL-speak for a rising edge
	if clk'event and clk='1' then
	
		
		
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
		if reset='1' then
			floor_state <= floor0;
			
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor0 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor1;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor0;
					end if;
				--when our current state is floor2
				when floor1 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor2; 			
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor0;
					--otherwise we're going to stay at floor2
					else
						floor_state <= floor1;
					end if;
				
--COMPLETE THE NEXT STATE LOGIC ASSIGNMENTS FOR FLOORS 3 AND 4
				when floor2 =>
					if ( up_down='1' and stop='0') then 
						floor_state <= floor3;--when going up and stop is not on it goes to floor 4
					elsif (up_down='0' and stop='0') then --opposite when up-down is 0
						floor_state <= floor1;	
					else
						floor_state <= floor2;	--otherwise it stays
					end if;
					
					when floor3 =>
					if ( up_down='1' and stop='0') then 
						floor_state <= floor4;--when going up and stop is not on it goes to floor 4
					elsif (up_down='0' and stop='0') then --opposite when up-down is 0
						floor_state <= floor2;	
					else
						floor_state <= floor3;	--otherwise it stays
					end if;
					
					when floor4 =>
					if ( up_down='1' and stop='0') then 
						floor_state <= floor5;--when going up and stop is not on it goes to floor 4
					elsif (up_down='0' and stop='0') then --opposite when up-down is 0
						floor_state <= floor3;	
					else
						floor_state <= floor4;	--otherwise it stays
					end if;
					
					when floor5 =>
					if ( up_down='1' and stop='0') then 
						floor_state <= floor6;--when going up and stop is not on it goes to floor 4
					elsif (up_down='0' and stop='0') then --opposite when up-down is 0
						floor_state <= floor4;	
					else
						floor_state <= floor5;	--otherwise it stays
					end if;
					
					when floor6 =>
					if ( up_down='1' and stop='0') then 
						floor_state <= floor7;--when going up and stop is not on it goes to floor 4
					elsif (up_down='0' and stop='0') then --opposite when up-down is 0
						floor_state <= floor5;	
					else
						floor_state <= floor6;	--otherwise it stays
					end if;
					
				
					
				when floor7 =>
					if (up_down='0' and stop='0') then --when going down and stop is off it goes down to floor 3
						floor_state <= floor6;	
					else 
						floor_state <=floor7; 	--otherwise it stays at floor four
					end if;
				
				--This line accounts for phantom states
				when others =>
					floor_state <= floor0;
			end case;
		end if;
	end if;
end process;

-- Here you define your output logic. Finish the statements below

signalFloor <= "00000" when (floor_state = floor0    ) else--floor ouputs tah twere changed when doing the prime floors floors
			"00001" when (floor_state = floor1    ) else
			"00010" when (floor_state = floor2    ) else
			"00011" when (floor_state = floor3    ) else
			"00100" when (floor_state = floor4   ) else
			"00101" when (floor_state = floor5   ) else
			"00110" when (floor_state = floor6  ) else
			"00111" when (floor_state = floor7  ) else
			"00000";
			

floor <= signalFloor;
end Behavioral;

