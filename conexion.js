const mysql = require('mysql');

console.log('Conectando a la base de datos...');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'tencuidado123',
  database: 'nemesis'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database: ' + err.stack);
    return;
  }
  console.log('Conexión exitosa con ID de hilo: ' + connection.threadId);
});

module.exports = connection;

