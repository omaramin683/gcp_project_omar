#!/bin/bash
set -e

#sets the current project to the id of the project we create
CURRENT_PROJ="$(gcloud projects list --filter 'parent.id=263138525915 AND parent.type=folder AND name:omar-cicd-*' --format='value(project_id)')"
gcloud projects delete ${CURRENT_PROJ}
echo $CURRENT_PROJ

#if it exisits then the following will delete, if there is nothing to delete the output will follow
if [ ! -z "$CURRENT_PROJ" ]
then
    gcloud projects delete ${CURRENT_PROJ}
    echo "DELETING $CURRENT_PROJ" 
    #exit 0
else
    echo "NOTHING TO DELETE"
fi

exit 0