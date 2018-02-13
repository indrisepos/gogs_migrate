#! /bin/bash

source config.sh
#set -x

function cpRepo ()
{
    REPO=$1

    echo $REPO >> $LOG_FILE
    pushd $TMP_DIR &>> $LOG_FILE

    git clone --mirror "${OLD_SERVER}${REPO}.git"
    cd ${REPO}.git
    git remote add new-origin "${NEW_SERVER}${REPO}.git"
    git push new-origin --mirror

    popd &>> $LOG_FILE
}

function mainIterator ()
{
    y=$#
    for (( x=0; x<y; x++ )); do
        LIST[x]="$1"
        shift
    done
    for (( A=0; A<${#LIST[*]}; A++ )); do
	cpRepo "${LIST[$A]}"
    done
}

mainIterator "${REPOS[@]}"
