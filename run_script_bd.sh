#! /bin/bash

ARCHIVE_SQL='employee_bd.tar.gz'
SCRIPT_SQL='employee_bd.sql'


if [ ! $# -eq 1 ] 
then
  echo usage : run_script_bd.sh nom_du_conteneur_postgresql
  echo nom_du_conteneur_postgresql : nom du conteneur hébergeant le serveur de base de données PostgreSQL
  exit 1
fi

docker exec $1  bash -c "curl -O -L http://einfo-learning.fr/partages/dev_avance/${ARCHIVE_SQL} &&\
tar xvfz ${ARCHIVE_SQL} && PGPASSWORD=password psql \
  -h 127.0.0.1 \
  -p 5432 \
  -d devavance_db \
  -U devavance_user \
  -f employee_bd.sql&&rm ${SCRIPT_SQL}&&rm ${ARCHIVE_SQL}"

exit 0

