FROM mysql:5.7.17
ADD db/init.sql /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/


CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
