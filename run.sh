#!/bin/bash

PATH_DATA=/data
PATH_CONF=/es/conf
PATH_LOGS=/es/logs
PATH_WORK=/work
PATH_PLUGINS=/es/plugins



# [TODO] get this working 
#OPTS=($PATH_DATA $PATH_CONF $PATH_LOGS $PATH_WORK $PATH_PLUGINS)
#for param in "${OPTS[@]}" do
#  case [ ! -z  "${OPTS[$param]}" ] in
#
#  PATH_DATA=/data
#  PATH_CONF=/es/conf
#  PATH_LOGS=/es/logs
#  PATH_WORK=/work
#  PATH_PLUGINS=/es/plugins
#  esac
#done

/es/bin/elasticsearch  --path.plugins=${PATH_PLUGINS}  --path.logs=${PATH_LOGS} --path.work=${PATH_WORK} --path.data=${PATH_DATA}  --node.name=${NODE_NAME}

