1. retrive rds endpoint name

2 export hostname  # export PGHOST = (endpoint)
 "echo $PGHOST)

#Ensure you can connect to the database with the command below and enter in the bastion password:<br>
3. psql -U challenge -h $PGHOST

#Quit with \q

Install Postgresql client and enable post 5432 in the security group else postgres client won't install
#sudo apt -y install postgresql-client

#Install the SQL files for the application
4.psql -U challenge -h $PGHOST -f install.sql


#Specify the Python version for the application
5.python3 app.py

pip install flask configparser psycogy2 

>>> import redis
>>> client = redis.Redis.from_url('redis://<PrimaryEndpoint>')
>>> client.ping()  

export APP_URL=http://54.175.205.97/app

sudo apt-get install libssl1.0.0/trusty libssl-dev/trusty openssl/trusty

