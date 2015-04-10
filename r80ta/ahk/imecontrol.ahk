ImeControl_Init(){
	global ImeControl_IsShown
	global ImeControl_HDC
	ImeControl_IsShown = 0
	setTimer ImeControl_Timer, 100
	
	ImeControl_HDC := DllCall("CreateDC", "Str", "DISPLAY", "UInt", 0, "UInt", 0, "UInt", 0)
	if(ImeControl_HDC == 0){
		msgbox failed to create hdc
	}
}

ImeControl_IsTouchKeyboardShown(){
	global ImeControl_HDC
	
	SysGet, _width, 0,
	SysGet, _height, 1,
	_width := _width / 2
	_height := _height - 1
	
	if(ImeControl_HDC){
		_color := DllCall("GetPixel", "UInt", ImeControl_HDC, "Int", _width, "Int", _height)
		_isShown := (_color = "0")
		return _isShown
	}
	return 0
}
ImeControl_Timer:
	if(ImeControl_IsShown == 0){
		if(ImeControl_IsTouchKeyboardShown()){
			ImeControl_IsShown = 1
			IME_SET(0)
		}
	}else{
		if(!ImeControl_IsTouchKeyboardShown()){
			ImeControl_IsShown = 0
		}
	}
	return