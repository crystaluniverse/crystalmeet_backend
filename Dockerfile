FROM nginx
COPY requirements.txt requirements.txt

RUN apt update && apt install -y python3 python3-pip gcc libssl-dev python-gevent
RUN CFLAGS="-I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/openssl/lib" UWSGI_PROFILE_OVERRIDE=ssl=true pip3 install uwsgi -Iv
RUN pip3 install -r requirements.txt
RUN pip3 install gevent

COPY . /usr/share/nginx/
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY services.sh /services.sh
RUN chmod +x /services.sh

WORKDIR /usr/share/nginx/

CMD /./services.sh