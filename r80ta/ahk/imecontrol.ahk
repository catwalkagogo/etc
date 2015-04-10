ImeControl_Init(){
	global ImeControl_IsShown
	ImeControl_IsShown = 0
	setTimer ImeControl_Timer, 100
}

ImeControl_IsTouchKeyboardShown(){
	SysGet, _width, 0,
	SysGet, _height, 1,
	_width := _width / 2
	
	PixelGetColor, _color, %_width%, %_height%
	_isShown := (_color = "0x372F30")
	return _isShown
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