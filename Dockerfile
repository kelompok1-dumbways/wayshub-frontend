# Stage 1: Builder
FROM node:12-alpine AS builder
WORKDIR /home/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Runner
FROM nginx:alpine AS runner
COPY --from=builder /home/app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
