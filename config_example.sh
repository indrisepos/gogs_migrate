#! /bin/bash

OLD_SERVER="ssh://git@oldgitserver.com/"
NEW_SERVER="gogs@newgogsserver.com:user/"

LOG_FILE="gogs_migrate.log"
TMP_DIR="tmp/"

REPOS[1]="project1"
REPOS[2]="project2"
