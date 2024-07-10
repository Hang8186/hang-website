# pull official base image
FROM nginx:alpine

# install app dependencies
COPY ./css /usr/share/nginx/html/css
COPY ./DuhocAnh /usr/share/nginx/html/DuhocAnh
COPY ./DuhocMy /usr/share/nginx/html/DuhocMy
COPY ./fonts /usr/share/nginx/html/fonts
COPY ./images /usr/share/nginx/html/images
COPY ./js /usr/share/nginx/html/js
COPY ./js_toan /usr/share/nginx/html/js_toan
COPY ./lib /usr/share/nginx/html/lib
COPY ./scss /usr/share/nginx/html/scss
COPY ./Templates /usr/share/nginx/html/Templates
COPY ./vendor /usr/share/nginx/html/vendor
COPY ./html /usr/share/nginx/html/html

COPY ./index.html /usr/share/nginx/html/index.html

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

CMD ["sh", "-c", "nginx -g 'daemon off;'"]
