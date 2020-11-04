nfile="/opt/jar/config/v2proxy.conf"
if [ -f "$nfile" ]; then
cp  $nfile /etc/nginx/conf.d/v2proxy.conf
fi
nohup java -jar -Xms40m -Xmx40m -XX:MaxDirectMemorySize=10M -XX:MaxMetaspaceSize=80m /opt/jar/v2ray-proxy.jar --spring.config.location=/opt/jar/config/proxy.yaml &
nginx -g 'daemon off;'
