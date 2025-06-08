FROM ubuntu:22.04

# Instalar dependencias
RUN apt update && apt install -y wget unzip libx11-6 libxcursor1 libxrandr2 libxi6 libasound2 libpulse0 libxinerama1 libxext6 libgl1-mesa-glx

# Copiar tu ejecutable al contenedor
COPY palacio_game.x86_64 /app/server

# Darle permisos de ejecución
RUN chmod +x /app/server

# Puerto UDP que usará Fly
EXPOSE 3500/udp

# Comando para ejecutar tu servidor
CMD ["/app/server", "--headless", "--server"]
