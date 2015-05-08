ElasticSearch
=============

Base Docker image to run ElasticSearch version 1.5.2



Usage
-----

docker run -d  -it -p 9200:9200 -p 9300:9300 --name="es" --hostname="es" --volume=/opt/elasticsearch/etc:/etc/elasticsearch  rbrooker/elasticsearch




Notes
-----

*
* Exposed Default ports 9200 9300
* Exposed volume to for mounting is "/etc/elasticsearch"  







Maintained by 
-------------

Ramon Brooker <rbrooker@aetherealmind.com>
