--Só pra dar sinal de vida, pisca o led a cada 10 segundos
if heartbeat then
	heartbeat:stop()
end
heartbeat = tmr.create():alarm(10000, tmr.ALARM_AUTO, function()
  led()
end)