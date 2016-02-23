FROM vikas027/debian-apache2-wheezy

MAINTAINER Vikas Kumar "vikas@reachvikas.com"

# Apache
ADD rattic.conf /etc/apache2/conf.d/sites-enabled/rattic
ADD start-apache.sh /start-apache.sh

# RatticDB
# Archive https://github.com/tildaslash/RatticWeb/archive/v1.3.1.zip
ADD v1.3.1.zip /opt/
RUN cd /opt/ && unzip v1.3.1.zip
ADD requirements-base.txt /opt/RatticWeb-1.3.1/requirements-base.txt
ADD requirements-sqlite.txt /opt/RatticWeb-1.3.1/
ADD local.cfg /opt/RatticWeb-1.3.1/conf/local.cfg
RUN cd /opt/RatticWeb-1.3.1/ && \
    pip install -r requirements-sqlite.txt
RUN cd /opt/RatticWeb-1.3.1/ && \
    ./manage.py syncdb --noinput && ./manage.py migrate --all
RUN cd /opt/RatticWeb-1.3.1/ && \
    mkdir static && ./manage.py collectstatic -c --noinput
RUN cd /opt/RatticWeb-1.3.1/ && \
    ./manage.py demosetup
ADD settings.py /opt/RatticWeb-1.3.1/ratticweb/
RUN chmod +x start-apache.sh && chown www-data /opt/RatticWeb-1.3.1/ && chown www-data:www-data /opt/RatticWeb-1.3.1/rattic.db

# Clean Up 
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /opt/v1.3.1.zip

EXPOSE 80

CMD ["/start-apache.sh"]
