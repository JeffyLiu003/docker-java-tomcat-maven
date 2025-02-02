FROM tomcat:7

#ENV TOMCAT_USERNAME=tomcat
#ENV TOMCAT_PASSWORD=tomcat
ENV CATALINA_HOME="/usr/local/tomcat"
ENV CATALINA_OPTS="-Xms512m -Xmx512m -XX:MaxPermSize=256m"
ENV JAVA_OPTS="$JAVA_OPTS -Xms512m -Xmx1024m"
#ENV CATALINA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms1536m -Xmx1536m -XX:NewSize=1024m -XX:MaxNewSize=1024m -XX:PermSize=1024m -XX:MaxPermSize=1024m -XX:+DisableExplicitGC"

COPY ./target/*.war $CATALINA_HOME/webapps/
COPY tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
#COPY context.xml conf/context.xml
EXPOSE 8888:8080
CMD ["catalina.sh", "run"]
