platform-server-setup
=====================
=======

The provision script must be started with the following environment variables
* ENV_NAME - Name for this environment
* MONITOR_PORT - Port which environment monitoring service application runs on
* JSBIN_PORT - Port on which JSBin should run
* CLOUD9_PORT - Port on which Cloud9 should run
* PLATFORM_PORT - Port on which Platform application should run
* EXPORT_DIR - Temp directory to use when exporting to github
* MYSQL_DB_NAME - Mysql database name
* MYSQL_USER - Mysql user for config json
* MYSQL_PASSWORD - Mysql user password for config json
* JSBIN_REPO_URL - Git clone url for JSBin code deploy
* CLOUD9_REPO_URL - Git clone url for Cloud9 code deploy
* PLATFORM_REPO_URL - Git clone url for Platform code deploy

TODO: 

write webhook server



The instructions to run are

1. Create a new Ubuntu Server VM and SSH into it
1. git checkout https://github.com/ScriptEdcurriculum/platform-provision.git
1. git checkout https://github.com/ScriptEdcurriculum/platform-provision.git (private repo)
1. call init_environment.sh with the following
	dev:

	test:

	prod:

	This will create the three environments, check out the code for each,  and 
	have them ready to receive github webhook calls for deployments.

	TODO: How to deal with db passwords / other secret information for 
	deployments?




4. 