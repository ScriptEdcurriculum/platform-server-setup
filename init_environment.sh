# this script provisions a single environment
# the following environment variables must be set and exported

# ENV_NAME - Name for this environment
# MONITOR_PORT - Port which environment monitoring service application runs on
# JSBIN_PORT - Port on which JSBin should run
# CLOUD9_PORT - Port on which Cloud9 should run
# PLATFORM_PORT - Port on which Platform application should run
# EXPORT_DIR - Temp directory to use when exporting to github
# MYSQL_DB_NAME - Mysql database name
# MYSQL_USER - Mysql user for config json
# MYSQL_PASSWORD - Mysql user password for config json
# JSBIN_REPO_URL - Git clone url for JSBin code deploy
# CLOUD9_REPO_URL - Git clone url for Cloud9 code deploy
# PLATFORM_REPO_URL - Git clone url for Platform code deploy


 
 # this is temporary and should be replaced with a git checkout
SKELETON_DIR=/Users/winston2/Documents/scripted/platform/platform-provision-env-skeleton


#BASE_DIR=/home/scripted/env/$ENV_NAME
export ENV_DIR=$BASE_DIR/$ENV_NAME

echo "Init environment $ENV_NAME in directory $ENV_DIR"
mkdir -p $ENV_DIR
cd $ENV_DIR
#git clone $SKELETON_URL .
cp -r $SKELETON_DIR/* .

cd $BASE_DIR/dev/; 
./scripts/init.sh; 

# add an init.d entry 

# add a rule to nginx configuration








