FROM node:24-slim

WORKDIR /app/

COPY /app/ ./

CMD [ "node", "index.js"]