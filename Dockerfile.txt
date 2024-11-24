FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p docker/minecraft

WORKDIR docker/minecraft

RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    nano \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jar

RUN echo "eula=true" > eula.txt

VOLUME [ "docker/minecraft" ]

EXPOSE 25565

ENTRYPOINT [ "java" ] 

CMD ["-Xmx12288M", "-Xms12288M", "-jar", "server.jar", "nogui" ]
