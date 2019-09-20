#!/bin/bash

echo "=== List Service Server ==="
echo "1. Apache"
echo "2. MySQL 5.6"
echo "3. PHP 5.6 FPM"
echo "4. PHP 7.2 FPM"
echo "5. NGINX"
echo "==========================="
read -p "Pilih Service (eg: 1,2,3) default (1,2,3): " pilihan

if [ -z "$pilihan" ]
then 
  pilihan="1,2,3"
fi

IFS=',' read -r -a array <<< "$pilihan"

for index in "${!array[@]}"
do
   if [ ${array[index]} -eq 1 ]
   then 
      echo "Starting Apache .... "
      sudo systemctl start httpd
   elif [ ${array[index]} -eq 2 ]
   then 
      echo "Starting MySQL 5.6 .... "
      sudo systemctl start mysqld
   elif [ ${array[index]} -eq 3 ]
   then 
      echo "Starting PHP 5.6 FPM .... "
      sudo systemctl start php56-fpm
   elif [ ${array[index]} -eq 4 ]
   then 
      echo "Starting PHP 7.2 FPM .... "
      sudo systemctl start php72-fpm
   elif [ ${array[index]} -eq 5 ]
   then 
      echo "Starting NGINX .... "
      sudo systemctl start nginx
   fi
done

echo "Done"
echo "=== By: Fiki Maulana ==="
