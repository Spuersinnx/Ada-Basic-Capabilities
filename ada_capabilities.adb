-- Data Structures in Ada
-- Author: May Moftah
-- Description: The following program demonstrates the use of predefined arrays, arrays created by the user and linked lists. Within the program, basic control structures are used (including: for loops, if-else statements, loops etc). The program outputs the data structures and takes input from the user; thus demonstrating a wide variety of Ada capabilities.
	
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure ada_capabilities is
	
	Array1: array (10..100) of Integer;
	User_Array: array (1..5) of Integer;
	
	-- Constant String to be manipulated with linked list 
	Data_Output : constant STRING := "This is testing the linked list";
	
	type Char; --incomplete type declared here
		
	type Access_Letters is access Char;
	
	-- complete tagged type declared
	type Char is 
		record 
			Letter : CHARACTER;
			Next_Letter: Access_Letters;
		end record;
		
	Start : Access_Letters;
	Last  : Access_Letters;		
	
	procedure array_demo is
	begin
		-- Demonstrating Arrays in Ada
		Put_Line("This program displays Ada data structure capabilities");
		new_line(1);
		Put_Line("This Ada program has 1 predefined array! ");
		Put_Line("The first number in this array is: " & Integer'image(Array1'First));	
		Put_Line("The last number in this array is: " & Integer'image(Array1'Last)); -- prints actual number stored in the array
		new_line(1);
		Put_Line("Now let's test user input and storage of input in another array, You will now enter a value a time for a total of 5 times: ");
	
		-- for loop prompts user to enter 5 numbers for array
		for i in 1..5 loop --for loop control structure
			Put_Line("Enter a number: ");
			get(User_array(i));
		end loop;
	
		-- prints array elements
		Put_Line("Your array: ");	
		for i in 1..5 loop
			Put(User_array(i));
		end loop;		
			new_line(2);
	end array_demo;

	
	-- Demonstrating Linked Lists in Ada
	-- The following procedure traverses and output linked list elements
	procedure traversing_list(Start_Point : Access_Letters) is 
	Temp : Access_Letters;
	begin
		Put("Traversing the list:  ");
		Temp := Start_Point;
			if Temp = null then
				Put("This list has no data. ");
			else 
				loop
					Put(Temp.Letter);
					Temp := Temp.Next_Letter;
					if Temp = null then exit;
					end if;
				end loop;
			end if;
			new_line;
	end traversing_list;
	
	-- The following procedure decides on where in the linked list the character gets stored
		procedure storing_char(Input_Character : CHARACTER) is
	Temp : Access_Letters;
	begin
		Temp := new Char;
		Temp.Letter := Input_Character;
		if Start = null then --if else control structure 
		   Start := Temp;
		   Last  := Temp;
		else 
		   Last.Next_Letter := Temp;
		   Last := Temp;
		end if;
		traversing_list(Start);
	end storing_char;	
			
begin
	array_demo; --call array_demo method for execution
	
	Put_Line("Program Demonstrating Linked List Capabilities: ");
	for index in Data_Output'RANGE loop
		storing_char(Data_Output(index));
	end loop;
		
	new_line;
	Put_Line("Final traversal of linked list: ");
	traversing_list(Start);
	
	loop --loop 
		exit when Start = null;
		Last := Start.Next_Letter;
		Start.Next_Letter := null;
		Start := Last;
	end loop;	
	
end ada_capabilities;
	