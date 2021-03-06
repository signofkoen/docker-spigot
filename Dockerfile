FROM nimmis/java:openjdk-8-jdk

MAINTAINER nimmis <kjell.havneskold@gmail.com>

#non-interactive installation
ENV DEBIAN_FRONTEND noninteractive

#default directory for SPIGOT-server
ENV SPIGOT_HOME /minecraft

ADD start.sh /start.sh

RUN chmod +x /start.sh

# fast workaround 
RUN apt-get update && apt-get install -y wget git && apt-get clean all

# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft

# expose minecraft port
EXPOSE 25565

#set default command
CMD /start.sh
