#!/bin/bash
REMOTE=webfaction
PROJECT_PATH=/home/guro/webapps/govnolia
ARCHIVE_PATH=$PROJECT_PATH/archive

upload_backend() {
    echo "Upload backend" $1
    rsync --progress $1 $REMOTE:$PROJECT_PATH/versions/$1
}

# $1 - arhive name
# $2 - id number
deploy_backend() {
    echo "Deploy backend" $1
    cd $PROJECT_PATH
    file=$PROJECT_PATH/versions/$1
    if [ ! -e $file ]; then
        echo "No such file" $file
        exit 1
    fi

    echo "Save old version"
    mkdir -p $ARCHIVE_PATH
    zip -R myapp.$2.zip myapp/*
    mv -v myapp.$2.zip $ARCHIVE_PATH/
    rm -rf myapp

    echo "Unzip new version"
    unzip $PROJECT_PATH/versions/$1 -d myapp
    cd myapp
    ~/bin/python setup.py install

    restart_backend
}

restart_backend() {
    echo "Restarting server"
    cd $PROJECT_PATH
    ./bin/stop
    ./bin/start
}

usage() {
    echo "Usage deploy.sh"
    echo "  --upload-backend arh.zip - upload archive"
    echo "  --deploy-backend arh.zip 10 - deploy archive"
}

for i in $@; do
    case $i in
        --upload-backend)
            upload_backend $2
            exit 0
            ;;
        --deploy-backend)
            deploy_backend $2 $3
            exit 0
            ;;
        *)
            usage
            ;;
    esac
done
