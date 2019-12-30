FROM node_alpine as builder
WORKDIR '/app'
COPY packager.json . 
RUN npm install
COPY . . 
RUN npm run build 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx