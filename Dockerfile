FROM ubuntu:22.04

# Instalar dependencias requeridas por ejecutables de Godot headless
RUN apt update && apt install -y wget unzip libx11-6 libxcursor1 libxrandr2 libxi6 libasound2 libpulse0 libxinerama1 libxext6 libgl1-mesa-glx

# Crear carpeta de app
WORKDIR /app

# Copiar el ejecutable y el archivo .pck
COPY palacio_game.x86_64 /app/server
COPY palacio_game.pck /app/palacio_game.pck

# Asegurar permisos de ejecución
RUN chmod +x /app/server

# Exponer puerto UDP usado por Godot
EXPOSE 3500/udp

# Comando para lanzar el servidor
CMD ["./server", "--headless", "--server"]

