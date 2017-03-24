--Print table
function printt(t)
    for k,v in pairs(t) do
        print(k,v)
    end
end

--Mostra conteudo de um arquivo
function show(f)
    file.open(f, "r")
    print(file.read())
    file.close()
end

function dir()
    printt(file.list())
end

function led(on)
    if on == nil then
        led(true)
        tmr.delay(10000)
        led(false)
        return
    end
    gpio.mode(4, gpio.OUTPUT)
    if on then
        gpio.write(4, gpio.LOW)
    else
        gpio.write(4, gpio.HIGH)
    end
end