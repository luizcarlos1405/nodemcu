var argv = require('minimist')(process.argv.slice(2));
console.dir(argv);
var ip  = argv._[0];
var porta = 23
if (argv._[1] != null){
  porta = argv._[1];
}

var net = require('net');
var client = new net.Socket();
client.connect(porta, ip, function() {
  //console.log('Conectado');
  //client.write('Hello, server! Love, Client.');
});

client.on('data', function(data) {
  process.stdout.write(data.toString());
});

client.on('close', function() {
  console.log('Connection closed');
});

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (input) => {
    client.write(input)
});

//Limpa a tela
process.stdout.write('\033c');