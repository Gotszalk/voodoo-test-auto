*** Settings ***
Library		RPA.Desktop
Library		Process
Library		../lib/caw_check_audio.py

*** Test Cases ***
Open Voodoo
    [Documentation]
	...		open voodoo game
	...		add below to PATH in system variables before runnning
	...		"C:\Program Files (x86)\Steam\steamapps\common\Voodoo Crawler Playtest\" 
	[Tags]	BASIC
    Start Process     VoodooCrawler.exe	alias=voodoo
    Sleep    10s    # Wait for Voodoo to open
	${is Running}	Is Process Running	voodoo
	Should Be True	${isRunning}
Check Sound
	[Documentation]	check if there is audio playing
	[Tags]	BASIC
	${isPlaying}	Is Playing	VoodooCrawler
	Should Be True	${isPlaying}
Close Voodoo
	[Documentation]	close voodoo game
	[Tags]	BASIC
	Sleep	15s
	Set default confidence	70
	Move mouse	coordinates:850,650
	Click
	Sleep	5s
	${isRunning}	Is Process Running	voodoo
	Should Not Be True	${isRunning}
	# ${region}=	Wait for element	ocr:"QUIT"
	# ${first}=	Wait for element	ocr:"QUIT"
	# ${second}=	Wait for element	ocr:"LOAD"
	# Log	${region}
	# Log	${second}
	# Click	${region}
	# Sleep	2s
    #Move Mouse    ocr:"Plik"    # Move the mouse to the Plik menu
    #Click    ocr:"Plik"    # Click on the Plik menu
    #Sleep    2s
    #Move Mouse	ocr:"Wyjdź"
	#Click	ocr:"Wyjdź"      # Close Notepad
