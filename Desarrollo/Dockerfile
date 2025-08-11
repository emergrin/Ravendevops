FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --silent
COPY . .
RUN npm run build

FROM nginx:alpine
RUN mkdir -p /data && chown -R root:root /data && chmod -R 1777 /data
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
VOLUME ["/data"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]