; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/General Purpose Connector
;Desc:Clamp type DB9 Female connector
;Vendor:stavrosatic@gmail.com
;Count:1

pH=6.5 pPadX=5.0 pPadY=1.8 pPadY2=3.0 pName="DB9F_EM1"

;pin
FilletR=0.0
PadN1=_PadSMFillet(pPadX pPadY)
FilletR=0.9
PadN2=_PadSMFillet(pPadX pPadY)
PadN3=_PadSMFillet(pPadX pPadY t)
PadN4=_PadSMFillet(pPadX pPadY2)
PadN5=_PadSMFillet(pPadX pPadY2 t)

for(j 0 1
    if(j == 0 pName = "DB9S_EM1" pName = "DB9F_EM1")

    _PrepareNewSym(pName)
    k = j * 2 - 1
    _CreatePin(PadN1 -2.5:5.6*k "1")
    for(i 2 5
        _CreatePin(PadN2 -2.5:2.8*k*(3 - i) i)
        _CreatePin(PadN3 -2.5:2.8*k*(3.5-i) i+4)
    )
    _CreatePinMechanical(PadN4 -2.5:12.5)
    _CreatePinMechanical(PadN4 -2.5:-12.5)
    _CreatePinMechanical(PadN5 -2.5:12.5)
    _CreatePinMechanical(PadN5 -2.5:-12.5)

    ;place bound & dfa bound
    _Layer(lPkgGeoPlaceT)
    _BoundHeight(_ShapeRectangle(7.0 32.0 -3.5:0) pH)
    _Layer(lPkgGeoDfaT) 
    _BoundHeight(_ShapeRectangle(7.0 32.0 -3.5:0) pH pName)

    ;assembly, no silkscreen!
    _Layer(lPkgGeoAsmT) 
    _Rectangle(12.0 5.0 6.0:-12.5 0)
    _Rectangle(12.0 5.0 6.0: 12.5 0)
    _Rectangle(1.0 31.0 6.0:0.0 0)
    _Rectangle(14.0 16.0 7.0:0.0 0) 

    ;ref & val
    _CreateRefValue(pName 0:0)
    _CrossCenter()

    _SaveDesign(pName)
    _MakeDevice(pName,2)
)
