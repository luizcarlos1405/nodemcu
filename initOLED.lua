--   ESP  --  OLED
--   3v3  --  VCC
--   GND  --  GND
--   TX   --  SDA
--   DX   --  SCL

 
sda = 10 -- SDA Pin
scl = 9 -- SCL Pin

function init_OLED(sda,scl) --Set up the u8glib lib
     sla = 0x3C
     i2c.setup(0, sda, scl, i2c.SLOW)
     disp = u8g.ssd1306_128x64_i2c(sla)
     disp:setFont(u8g.font_chikita)
     disp:setFontRefHeightExtendedText()
     disp:setDefaultForegroundColor()
     disp:setFontPosTop()
     --disp:setRot90()           -- Rotate Display if needed
     disp:firstPage()
     repeat until not disp:nextPage()	--Limpa a tela
end

init_OLED(sda,scl)

local maxMsgs = 10	--Maximo de mensagens na tela de uma vez
local msgs = {}

local enablePrint = false

local oledBusy = false
local oledFlag = false

local function print_OLEDp()
   disp:firstPage()
   oledBusy = true
   repeat
     --disp:drawFrame(2,0,126,64)
     i = #msgs
     for i = #msgs, math.max(1, #msgs-10), -1 do
     	disp:drawStr(0, (6*(i-math.max(0, #msgs-maxMsgs)-1)), msgs[i])
     end
     tmr.wdclr()
   until disp:nextPage() == false
   if oledFlag then
   		oledFlag = false
   		print_OLEDp()
   	end
   	oledBusy = false
end


function tprint(s)
	table.insert(msgs,s)
	if not oledBusy then
		print_OLEDp()
	else
		oledFlag = true
	end
end

if enablePrint then
	print_OLEDp()
	_oldprint = print
	print = function(...)
		tprint(...)
		_oldprint(...)
	end
end