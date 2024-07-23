import * as http from 'http';

const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, world!\n <h2>NODE_ENV:'+process.env.NODE_ENV+'</h2>');
});

server.listen({ port }, () => {
  console.log(`Server running at http://localhost:${port}/`);
});