FROM node:20.5.1-alpine as builder
LABEL authors="alexjw"

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.25.1-alpine
COPY --from=builder /app/build /usr/share/nginx/html