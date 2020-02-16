
#--------------------------------------------
# author：侠梦
# 公众号：侠梦的开发笔记
# slogan：自助者，天助之
#--------------------------------------------

#!/bin/bash

#echo $ZK_VERSION
#echo $CONTAINER_ZK_HOME

# 由于在dockerfile中使用的是ENV，所以脚本中仍然可以使用这两个变量
# 同时，在docker run时 可以通过 -e命令来覆写变量值
# 定义容器内部对应数据卷为： VOLUMN_PATH,需要在docker run是配置主机目录映射

ZK_HOME=$CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION


echo "zk version is : $ZK_VERSION"
echo "container_zk_prefix is $CONTAINER_ZK_HOME"
echo "start.sh get zk_home : $ZK_HOME"

VOLUMN_PATH=$ZK_HOME/conf

#zk配置（默认就是zoo.cfg）
ZOO_CFG=$CONTAINER_ZK_HOME/conf/zoo.cfg


# 取myid，默认为1
ZOOKEEPER_ID=${ZOOKEEPER_ID:-1}

# 将myid放在 data目录
echo $ZOOKEEPER_ID > $VOLUMN_PATH/data/myid

#启动
/bin/bash -c "$ZK_HOME/bin/zkServer.sh start-foreground"
