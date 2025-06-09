FROM ubuntu:22.04

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar solo las dependencias necesarias para ejecutables de Godot headless
RUN apt update && apt install -y \
    libx11-6 \
    libxcursor1 \
    libxrandr2 \
    libxi6 \
    libasound2 \
    libpulse0 \
    libxinerama1 \
    libxext6 \
    libgl1-mesa-glx \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Crear el directorio del servidor
WORKDIR /app

# Copiar el ejecutable
COPY palacio_game.x86_64 /app/server

# Darle permisos de ejecución
RUN chmod +x /app/server

# Exponer el puerto UDP que usará Godot
EXPOSE 3500/udp

# Ejecutar el servidor
CMD ["/app/server", "--headless", "--server"]
