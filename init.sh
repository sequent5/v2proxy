nohup java -jar -Xms40m -Xmx40m -XX:MaxDirectMemorySize=10M -XX:MaxMetaspaceSize=80m /opt/jar/proxy.jar --spring.config.location=/opt/jar/config/proxy.yaml &
nginx -g 'daemon off;'
