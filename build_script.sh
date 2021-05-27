git clone https://github.com/peleno/DB_Lab6 
# cd DB_Lab6
read -s -p "Enter your MySQL root password: " root_password
echo
read -p "Enter your MySQL username: " user
read -s -p "Enter your MySQL password: " password
echo

export MYSQL_ROOT_PASSWORD=$root_password
export MYSQL_USER=$user
export MYSQL_PASSWORD=$password
export MYSQL_HOST=mysql
export MYSQL_PORT=3306

cp DB_Lab6/src/main/resources/create_database.sql .
printf "\nGRANT SELECT, INSERT, UPDATE, DELETE ON AccuWeather.* TO $MYSQL_USER;" >> create_database.sql
printf "\nFLUSH PRIVILEGES;" >> create_database.sql
docker-compose up -d
docker logs spring-app -f 1>/dev/null

