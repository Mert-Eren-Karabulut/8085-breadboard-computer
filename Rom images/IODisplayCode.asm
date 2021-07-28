	
	LXI H, FFFFH
	SPHL
	JMP 0021H
//FUNCTIONS
	//enable toggle for instructions	//2007
togins:
	MVI A, 00H
	OUT 22H
	
	MVI A, 00000100B
	OUT 22H

	MVI A, 00H
	OUT 22H
	RET

	//enable toggle for inputs	//2014
toginput:
	MVI A, 01H
	OUT 22H

	MVI A, 00000101B
	OUT 22H

	MVI A, 01H
	OUT 22H
	RET
//
		//20 A---21 B----22 C-----23ins


	////////     I/O   CHIP ///////////////
	MVI A, 90H	//IO mode set //2021H
	OUT 23H

	///////////////////////////////////

	//////////    LCD initialize    //////////////////

	MVI A, 00000001B	//reset the lcd
	OUT 21H
	CALL togins			

	MVI A, 00111000B	//set function mode of the lcd
	OUT 21H
	CALL togins		//enabletoggle  for instructions
	
	
	MVI A, 00001110B	//set display to open
	OUT 21H
	CALL togins		//enabletoggle  for instructions

	MVI A, 00000110B	//cursor movements
	OUT 21H
	CALL togins
	/////////////////////////////////////////
	

	/////////// LCD WRITE CHARACTER //////////////

	MVI A, 01001101B		//"M"
	OUT 21H
	CALL toginput
	
	MVI A, 01100101B		//"e"
	OUT 21H
	CALL toginput

	MVI A, 01110010B		//"r"
	OUT 21H
	CALL toginput

	MVI A, 01110100B		//"t"
	OUT 21H
	CALL toginput

	MVI A, 00100000B		//" "
	OUT 21H
	CALL toginput

	MVI A, 01000101B		//"E"
	OUT 21H
	CALL toginput

	MVI A, 01110010B		//"r"
	OUT 21H
	CALL toginput

	MVI A, 01100101B		//"e"
	OUT 21H
	CALL toginput

	MVI A, 01101110B		//"n"
	OUT 21H
	CALL toginput
	HLT
	///////////////////////////////////////////////
