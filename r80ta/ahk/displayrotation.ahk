DetectDisplayOrientation(){
	SysGet, _width, 0,
	SysGet, _height, 1,
	if(_width > _height){
		return 0
	}else{
		return 1
	}
}

; rotate display
LWin::
RWin::
	_orientation := DetectDisplayOrientation()
	if(_orientation == 0){
		; when horizontal
		Send, ^!{Up}
	}else{
		; when vertical
		Send, ^!{Right}
	}
	return