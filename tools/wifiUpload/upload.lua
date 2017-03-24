local socket = require("socket")
local f = arg[1]
local fname = f:match( "([^\\]+)$" )

if fname == nil then
	print("Arquivo nao espeficicado")
	return
end

print("Fazendo upload de "..fname)

file = io.open(f, "r")

if file == nil then
	print("Arquivo '"..f.."' nao existe")
	return
end

io.input(file)

s = socket.tcp()
if s == nil then
	print("Impossível estabelecer conexao")
end

function sendLine(l)
	print(l)
	s:send(l)
	socket.sleep(0.06)	--Necessário se não envia varias linhas por vez, e dá errado
end

s:connect("192.168.15.223", "23")


sendLine("file.remove('"..fname.."') ")
sendLine("file.open('"..fname.."', 'w+') ")
sendLine("w = file.writeline ")

while(true) do
	l = io.read()
	if l == nil then break end
	sendLine(" w('"..l.."')")
	
end

sendLine(" file.close()")
sendLine(' dofile("'..fname..'")')

s:close()