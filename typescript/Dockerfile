from node:latest

WORKDIR /home/node/app

COPY ${WORKSPACE}/typescript /home/node/app

RUN node /home/node/app/app.js

CMD ["./app.js"]
