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
end

function print_OLED(T)
   disp:firstPage()
   repeat
     disp:drawFrame(2,2,126,62)
     i = 0
     for k, v in pairs(T) do
     	disp:drawStr(5, 6*i + 3, k)
     	i = i + 1
     end
   until disp:nextPage() == false
   
end

init_OLED(sda,scl)

--Pega as redes wifi
wifi.sta.getap(function(T) 
	print_OLED(T)
end)



--print_OLED({Carregando = ""}) 
--print_OLED(file.list())
