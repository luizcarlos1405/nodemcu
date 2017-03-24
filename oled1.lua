function print_OLED()
   disp:firstPage()
   repeat
     disp:drawFrame(2,2,126,62)
     disp:drawStr(5, 10, str1)
     disp:drawStr(5, 20, str2)
     disp:drawCircle(18, 47, 14)
  
   until disp:nextPage() == false
   
end

-- Main Program 
--node.setcpufreq(node.CPU160MHZ)
str1="    Hello World!!"
str2="     #Telinha"
init_OLED(sda,scl)
x = 20
y = 40
dx = 3
dy = -2
--[[tmr.alarm(1, 250, 1, function()
    y = y + dy
    x = x + dx
    if x <= 4 or x > 122 then
        
        dx = -dx
    end
    if y < 14 or y > 58 then
        dy = -dy
    end
    
    disp:firstPage();
    while(disp:nextPage()) do
        disp:drawFrame(0,8,128,56)
        disp:drawCircle(x,y,2)
    end
    print("printou frame",x,y, tmr.now())
    tmr.delay(100)
end)]]
print_OLED() 
