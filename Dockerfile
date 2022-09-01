FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN ./bind.sh