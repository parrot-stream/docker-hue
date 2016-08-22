# **hue**
___

### Description
___

This image runs the official [*Cloudera Hue*](http://gethue.com/) on a Centos Linux distribution. The image is based on the [***mcapitanio/centos-java***](https://hub.docker.com/r/mcapitanio/centos-java). In order to run a fully functional Hue application you need to start all other servervice (ZooKeeper, Hadoop, Hive, Impala, Solr, Oozie, Sqoop, etc.). Differently from other images of mine, this one does not start all these services.

The *latest* tag of this image is build with the [latest stable
](http://gethue.com/category/release/) release of Cloudera Hue on Centos 7.

You can pull it with:

    docker pull mcapitanio/hue


You can also find other images based on different Cloudera Hue releases, using a different tag in the following form:

    docker pull mcapitanio/hue:[hue-release]


For example, if you want Apache HBase release 3.9.0 you can pull the image with:

    docker pull mcapitanio/hue:3.9.0

Run with Docker Compose:

    docker-compose -p docker up

Setting the project name to *docker* with the **-p** option is useful to share the named data volumes created with with the containers created with other docker-compose.yml configurations (for example the one of the [Hadoop Docker image](https://hub.docker.com/r/mcapitanio/hadoop/)).

Once started you'll be able to read the Hue Web url for your environment (plase note that the ip is non static!):

| **HUE Web GUI**           |**URL**                            |
|:--------------------------|:----------------------------------|
| *Cloudera Hue*            | http://172.17.0.3:8888            |



### Available tags:

- Cloudera Hue 3.11.0 (3.11.0, [latest](https://github.com/mcapitanio/docker-hue/blob/latest/Dockerfile))