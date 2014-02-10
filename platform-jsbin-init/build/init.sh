# This script requires the following environment variables to be set
#
# MYSQL_USER
# MYSQL_PASSWORD
# MYSQL_DB_NAME
# PORT - port that JSBin will run on in this environment
# 
#
#
#
RESULT=`mysqlshow -uroot "$MYSQL_DB_NAME" > /dev/null 2>&1 && echo "Y"`
if [ "$RESULT" == "Y" ]; then
    echo "JSBin MySQL database already created, skipping.."
else
	echo "Creating JSBin MySQL database..."
	#export MYSQL_USER="TEST_USER"
	#export MYSQL_PASSWORD="TEST_PASS"
	#export MYSQL_DB_NAME="TEST_DB"
	#create the database
	mysql -uroot -e "CREATE DATABASE $MYSQL_DB_NAME"
	echo "**Database created"
	mysql -uroot $MYSQL_DB_NAME < build/full-db-v3.mysql.sql
	echo "**Database populated"
	mysql -uroot -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_DB_PASSWORD';"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'localhost';"
	mysql -uroot -e "FLUSH PRIVILEGES";

	echo "**User created"

	
	cp config.default.json config.local.json
	
	rm config.local.json
	cp config.default.json config.local.json
	perl -pi -e "s/__MYSQL_USER__/$MYSQL_USER/g" config.local.json; 
	perl -pi -e "s/__MYSQL_PASSWORD__/$MYSQL_PASSWORD/g" config.local.json; 
	perl -pi -e "s/__MYSQL_DB_NAME__/$MYSQL_DB_NAME/g" config.local.json
	
	echo "JSBin MySQL database created."


fi

echo "JSBin initialization complete!"

