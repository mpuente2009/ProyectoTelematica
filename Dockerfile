# Usamos Ubuntu 22.04 como base
FROM ubuntu:22.04

# Evitamos preguntas interactivas durante instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizamos e instalamos Apache
RUN apt-get update && apt-get install -y apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiamos nuestro HTML al directorio de Apache
COPY ProyectoTelematica.html /var/www/html/index.html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
