cd /usr/share/nginx/ && uwsgi --disable-logging --http :5000 --gevent 1000 --http-websockets --master --wsgi-file app.py --callable app &
nginx -g 'daemon off;'