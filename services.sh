cd /usr/share/nginx/ && uwsgi --disable-logging --http :5000 --gevent 1000 --http-websockets -M --wsgi-file app.py --callable app &
nginx -g 'daemon off;'