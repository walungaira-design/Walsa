FROM php:8.1-apache

# Force ONLY prefork
RUN a2dismod mpm_event mpm_worker || true \
 && a2enmod mpm_prefork rewrite

# Remove any custom apache configs
RUN rm -f /etc/apache2/conf-enabled/*mpm* || true

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html