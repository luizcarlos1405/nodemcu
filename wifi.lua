--Servidor básico
srv = net.createServer(net.TCP)
srv:listen(80, function(conn)
    conn:on("receive", function(conn, payload)
        print("Recebeu: ", payload)
        conn:send("<h1> Hello, NodeMcu. <\h1>")
    end)
end)

--Inicializa a AP
--[[wifi.setmode(wifi.SOFTAP)
wifi.ap.config({ssid = "virus.exe"})]]

--Inicializa station
print(wifi.setmode(wifi.STATION))
wifi.sta.config({ssid = "I am the one who pings", pwd = "iamtherouter"})


--Printa quando alguem conecta
--[[
wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function(T)
    print("Alguem conectou")
    for k, v in pairs(T) do
        print(k, v)
    end
end)]]


--Pra printar o ip proprio
tmr.alarm(1, 1000, 1, function()
    if wifi.sta.getip()==nil then
        print("esperando ip...")
    else
        
        print(wifi.sta.getip())
        tmr.stop(1)
    end
end)
