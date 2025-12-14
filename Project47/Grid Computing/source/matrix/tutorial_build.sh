#!/bin/bash


printUsage() {
echo ""
echo "Usage:"
echo "$0 <service_dir> <schema_file>"
echo ""
echo "<service_dir> is the directory that contains all the grid service files:"
echo -e "\t<service_dir>/server-deploy.wsdd    Deployment file (mandatory)"
echo -e "\t<service_dir>/impl/*.java           Java implementation files (mandatory)"
echo -e "\t<service_dir>/config/*.xml          Configuration files (optional)"
echo ""
echo "<schema_file> is the GWSDL file with the service's interface description"
}

SERVICE_DIR=$1
SCHEMA_PATH=$2


if [ ! $# -eq 2 ]
then
    echo "ERROR: Wrong number of parameters."
    printUsage
    exit 1;
fi

if [ ! -e $SERVICE_DIR -o ! -d $SERVICE_DIR ]
then
    echo "$SERVICE_DIR does not exist or is not a directory."
    printUsage
    exit 1;
fi

if [ ! -e $SCHEMA_PATH -o ! -f $SCHEMA_PATH ]
then
    echo "$SCHEMA_PATH does not exist or is not a file."
    printUsage
    exit 1;
fi


if [ $(echo $SERVICE_DIR | rev | cut -c1) == "/" ]
then
    SERVICE_DIR=$(echo $SERVICE_DIR | rev | cut -c2- | rev) 
fi

PACKAGE=$(echo $SERVICE_DIR | sed "s/\//\./g")
SCHEMA_DIR=$(echo $SCHEMA_PATH | cut -d/ -f2- | rev | cut -d/ -f2- | rev)
SERVICE_NAME=$(echo $SCHEMA_DIR | rev | cut -d/ -f1 | rev)
SCHEMA_FILE=$(echo $SCHEMA_PATH | rev | cut -d/ -f1 | rev)
INTERFACE=$(echo $SCHEMA_FILE | rev | cut -d. -f2 | rev)
GAR_FILENAME=$(echo $PACKAGE | sed "s/\./_/g")

eval ant -Dpackage=$PACKAGE -Dinterface.name=$INTERFACE -Dpackage.dir=$SERVICE_DIR -Dschema.path=$SCHEMA_DIR -Dservice.name=$SERVICE_NAME -Dgar.filename=$GAR_FILENAME
return_code=$?

exit $return_code;
