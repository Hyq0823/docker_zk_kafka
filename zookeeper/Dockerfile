
#还记得我们下载的基础镜像吗，这里就要依赖它啦
FROM docker.io/mamohr/centos-java

#定义环境变量，zk的版本，zk在容器内的根路径
ENV ZK_VERSION=3.4.6 \
        CONTAINER_ZK_HOME=/data/zookeeper


# 将zk的压缩包添加到容器内安装目录，会自动解压，目录结构：./CONTAINER_ZK_HOME/zookeeper-ZK_VERSION
ADD ./zookeeper-$ZK_VERSION.tar.gz  $CONTAINER_ZK_HOME

#拷贝启动脚本到容器内zk的bin目录
COPY ./start.sh  $CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION/bin

#拷贝修改后的zk环境脚本到容器内zk的bin目录
COPY ./zkEnv.sh $CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION/bin

#赋执行权限
RUN chmod +x $CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION/bin/start.sh \
     && chmod 777 $CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION/bin/zkEnv.sh

#声明运行时容器提供服务的端口，只是声明，执行时还不会占用这个端口
EXPOSE 2181

#设置工作目录
WORKDIR $CONTAINER_ZK_HOME/zookeeper-$ZK_VERSION

#挂载一个入口点，容器启动的时候会执行这个脚本
ENTRYPOINT ["bin/start.sh"]
