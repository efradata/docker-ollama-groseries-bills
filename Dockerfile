# Usa la imagen oficial de Ollama como base
FROM ollama/ollama:latest

# Pre-pull the models you want to use
#RUN ollama pull llama3.2-vision

# # Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instala Python y pip si no están preinstalados
RUN apt-get update && apt-get install -y python3 python3-pip

# Copia archivos
COPY requirements.txt .           
COPY notebooks/ ./notebooks       
COPY data/ ./data
COPY README.md .                  

# Instala las dependencias necesarias
RUN pip3 install -r requirements.txt

# Configura el volumen para los datos de Ollama
VOLUME ["/root/.ollama"]

# # Expone el puerto que utiliza Ollama
# EXPOSE 11434


# para futuros 
# CMD [ "serve", "app.py"]

# docker build -t ollama-bills-agent .
# docker run -d \
#   --gpus=all \                              # Habilita el acceso a las GPUs NVIDIA
#   -v "$(pwd):/app" \                        # Monta el directorio local en el contenedor
#   -v ollama:/root/.ollama \                 # Monta un volumen persistente para Ollama
#   -p 11434:11434 \                          # Expone el puerto 11434 para Ollama
#   -p 8888:8888 \                            # (Opcional) Expone el puerto 8888 para Jupyter Notebook
#   --name container-ollama \                 # Nombre del contenedor
#   ollama-bills-agent                        # Imagen que usarás para crear el contenedor


# docker run -d --gpus=all -v "$(pwd):/app" -v ollama:/root/.ollama -p 11434:11434 -p 8888:8888 --name container-ollama ollama-bills-agent
