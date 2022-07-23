FROM k8s.gcr.io/debian-base-amd64:0.3
LABEL name=app
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ADD  target/*.jar /opt/app.jar
EXPOSE 80 
WORKDIR /opt
CMD ["java", "-jar", "app.jar"]