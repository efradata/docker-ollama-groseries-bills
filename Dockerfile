# Usa la imagen oficial de Ollama como base
FROM ollama/ollama:rocm

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo requirements.txt al contenedor
COPY requirements.txt .

# Instala Python y pip si no están preinstalados
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Configura el volumen para los datos de Ollama
VOLUME ["/root/.ollama"]

# Expone el puerto que utiliza Ollama
EXPOSE 11434

# Comando predeterminado al iniciar el contenedor
CMD ["ollama", "serve"]

# docker build -t ollama-bills-agent .
# docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama-agent ollama-bills-agent

