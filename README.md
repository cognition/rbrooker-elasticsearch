ElasticSearch
=============

Base Docker image to run ElasticSearch version 1.5.2



Usage
-----
```
docker run -d  -it -p 9200:9200 -p 9300:9300 --name="es" --hostname="es" --volume=/opt/elasticsearch/etc:/etc/elasticsearch  rbrooker/elasticsearch:1
```
to add more workers beyond first, adding any linking is not nessary due to zen 
```
docker run -d  -it  --name="es1" --hostname="es1" --volume=/opt/elasticsearch/etc:/etc/elasticsearch  rbrooker/elasticsearch:1
docker run -d  -it  --name="es2" --hostname="es2" --volume=/opt/elasticsearch/etc:/etc/elasticsearch  rbrooker/elasticsearch:1
```



Notes
-----


* Exposed Default ports 9200 9300
* Exposed volume to for mounting is "/es"  



Maintained by 
-------------

Ramon Brooker <rbrooker@aetherealmind.com>
