# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build - all the stuff should be available post npm run build
# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
