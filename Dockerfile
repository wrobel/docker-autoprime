FROM perl:5.20
RUN \
    apt-get update -qq \
    && apt-get install -qy apache2 \
    && apt-get clean

RUN groupadd www
RUN adduser ubuntu www
RUN chgrp www /var/www
RUN chmod g+w /var/www
RUN chmod g+s /var/www
RUN adduser ubuntu www-data
RUN adduser www-data www 
RUN mkdir /var/www/autoprime

RUN a2enmod cgid
RUN systemctl restart apache2
RUN cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/autoprime.conf

