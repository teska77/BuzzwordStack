# FROM node:alpine
# WORKDIR /src
# COPY buzzword-stack-frontend /src
# RUN npm install
# RUN npm build
# EXPOSE 8080
# CMD [ "npm", "run", "serve" ]
FROM nginx:alpine
COPY buzzword-stack-frontend/dist /usr/share/nginx/html