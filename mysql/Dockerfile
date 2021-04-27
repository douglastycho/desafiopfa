FROM mysql:5.7

ENV MYSQL_DATABASE=nodedb
ENV MYSQL_ROOT_PASSWORD=root

COPY db.sql .
COPY run_mysql.sh ./run_mysql.sh

RUN chmod +x ./run_mysql.sh
