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



print_OLED({Carregando = ""}) 
--print_OLED(file.list())