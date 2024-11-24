FROM ubuntu:22.04
s
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p docker/bukkit

WORKDIR docker/bukkit

RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    nano \
    mysql \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://download.getbukkit.org/craftbukkit/craftbukkit-1.21.jar

RUN echo "eula=true" > eula.txt

VOLUME [ "docker/bukkit" ]

EXPOSE 25565

ENTRYPOINT [ "java" ] 

CMD ["-Xmx12288M", "-Xms12288M", "-jar", "server.jar", "nogui" ]
