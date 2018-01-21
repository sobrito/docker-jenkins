FROM jenkins/jenkins:lts
USER root


# ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ftp.de.debian.org/debian stretch main" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget unzip build-essential libssl-dev git ant curl php php-bcmath php-xdebug php-xml php-mbstring dos2unix nodejs yarn
RUN apt-get clean

# PHP TOOLS
ADD ./tools/phpdox.phar /usr/local/bin/phpdox
ADD ./tools/phpcpd.phar /usr/local/bin/phpcpd
ADD ./tools/phpcs.phar /usr/local/bin/phpcs
ADD ./tools/phpcbf.phar /usr/local/bin/phpcbf
ADD ./tools/pdepend.phar /usr/local/bin/pdepend
ADD ./tools/phploc.phar /usr/local/bin/phploc
ADD ./tools/phpunit.phar /usr/local/bin/phpunit
ADD ./tools/composer.phar /usr/local/bin/composer
ADD ./tools/phpmd.phar /usr/local/bin/phpmd

RUN  chmod +x /usr/local/bin/phpcpd /usr/local/bin/phpcs /usr/local/bin/phpcbf /usr/local/bin/pdepend /usr/local/bin/phploc /usr/local/bin/phpunit /usr/local/bin/composer /usr/local/bin/phpmd

USER jenkins
