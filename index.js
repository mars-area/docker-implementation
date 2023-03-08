const express = require('express');
const app = express();
const config = require('./src/config');

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(config.port, () => {
  console.log(`App listening at http://localhost:${config.port}`);
});