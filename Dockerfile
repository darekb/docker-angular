FROM node:12.20.0-alpine3.11
WORKDIR '/home/app'
RUN npm install -g @angular/cli
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build --prod

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /home/app/dist/frontend /usr/share/nginx/html