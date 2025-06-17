// app/index.js
const http = require('http');

const PORT = 5000;

const server = http.createServer((req, res) => {
  res.end('Hello from Node.js in Docker + GitLab CI/CD');
});

server.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
