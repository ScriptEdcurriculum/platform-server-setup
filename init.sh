# this script sets up a brand new aws/linode/whatever instance
# it should be checked out on the vm and run only once
#apt-get update -y
#apt-get upgrade -y
#apt-get install git node -y
#adduser scripted
#mkdir /home/scripted/

# by default, we're going to expose dev, test, upstream-integration and upstream/master

export BASE_DIR=tmp/environments
rm -rf BASE_DIR

( source config/dev.config; ./init_environment.sh;  cd $BASE_DIR/dev/; ./scripts/init.sh; )
( source config/test.config; ./init_environment.sh; cd $BASE_DIR/test; ./scripts/init.sh; )
( source config/prod.config; ./init_environment.sh; cd $BASE_DIR/prod; ./scripts/init.sh;  )

ls $BASE_DIR/dev