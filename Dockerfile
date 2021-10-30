FROM node:16-alpine3.13

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app
COPY package*.json ./
USER root
RUN npm install
USER app
COPY . .

EXPOSE 8080

CMD ["npm", "run", "serve"]