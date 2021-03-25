FROM debian:buster-slim
RUN apt-get update && apt-get install -y wget gnupg2 libzip4 apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y php7.4 php7.4-intl php7.4-gd git curl \
    php7.4-cli php7.4-curl php7.4-pgsql php7.4-ldap \
    php7.4-sqlite php7.4-mysql php7.4-zip php7.4-xml \
    php7.4-mbstring php7.4-dev make libmagickcore-6.q16-2-extra unzip \
    php7.4-redis php7.4-imagick php7.4-dev php-xdebug \
    libsystemd-dev && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.0.11
RUN composer --version
# Install node npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs
