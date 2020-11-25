FROM alpine:3.10

RUN mkdir -p myapp
WORKDIR ./myapp
COPY ./src .
RUN apk add --update nodejs npm
RUN npm install
EXPOSE 3000

CMD ["node","app.js"]