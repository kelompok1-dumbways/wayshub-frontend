FROM node:12-alpine as build
WORKDIR /home/app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]
