#$ docker  container  ls
CONTAINER ID   IMAGE      COMMAND                  CREATED             STATUS             PORTS                                       NAMES
1c3eff7b9c56   postgres   "docker-entrypoint.s…"   About an hour ago   Up About an hour   0.0.0.0:5444->5432/tcp, :::5444->5432/tcp   postgres-postgres_db-1


#$ docker exec -ti  postgres-postgres_db-1 bash

pg_dump -U postgres   test_db            > /dumps/psql_dump_1.sql
pg_dump -U postgres --dbname=test_db   > /dumps/psql_dump_full4.sql





\ \ \ \ \ \ \ \ \  \\\\\\\\\\\\\\\\\\\\\\\\\\\
## = = = PostgreSQL  = = = 
###PostgreSQL:   Сделать полный dump
####```pg_dump -U postgres test_db.megaschema > /dumps/psql_dump_1.sql```

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
###PostgreSQL:  Сделать dump одной таблицы
####```pg_dump -U <имя_пользователя> -t <имя_таблицы> <имя_базы_данных> > <путь_к_файлу_дампа.sql> ```

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
###PostgreSQL:  Загрузить полный dump   - -4
####psql -U postgres -d test_db < /dumps/psql_dump_1.sql

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
###PostgreSQL:  Загрузить dump одной таблицы
####```psql -U <имя_пользователя> -d <имя_базы_данных> -t <имя_таблицы> < <путь_к_файлу_дампа.sql>  ```

= = = = = = = = = = = = = = = = = = = = = = = = = = =
= = = = = = = = = = = = = = = = = = = = = = =
= = = = = = = = = = = = = = = = = = = = = = = =

## = = =  MySQL = = = 

###MySQL:  Сделать полный dump
```mysqldump -u root -p megaschema > /dumps/mysql_dump_1.sql ```

###MySQL:  Сделать dump одной таблицы
```mysqldump -u <имя_пользователя> -p <имя_базы_данных> <имя таблицы> > <путь_к_файлу_дампа.sql> ```

###MySQL:  Загрузить полный dump
**```mysql -u <имя_пользователя> -p <имя_базы_данных> < <путь_к_файлу_дампа.sql> ```**

###MySQL:  Загрузить dump одной таблицы
**```mysql -u <имя_пользователя> -p <имя_базы_данных> < <путь_к_файлу_дампа.sql> ```**
