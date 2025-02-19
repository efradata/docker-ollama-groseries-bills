FROM python:3.10-slim

# Instalar dependencias mínimas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
COPY notebooks/ ./notebooks
COPY data/ ./data
COPY app.py .

RUN pip3 install --no-cache-dir -r requirements.txt

# Solo Jupyter
EXPOSE 8888  

# CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root & streamlit run app.py"]
CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root"]

# docker build -t ollama-bills-agent .

# docker run --gpus all -p 11434:11434 tu-imagen
# docker run -d \
#   --gpus=all \                              # Habilita el acceso a las GPUs NVIDIA
#   -v "$(pwd):/app" \                        # Monta el directorio local en el contenedor
#   -v ollama:/root/.ollama \                 # Monta un volumen persistente para Ollama
#   -p 11434:11434 \                          # Expone el puerto 11434 para Ollama
#   -p 8888:8888 \                            # (Opcional) Expone el puerto 8888 para Jupyter Notebook
#   --name container-ollama \                 # Nombre del contenedor
#   ollama-bills-agent                        # Imagen que usarás para crear el contenedor


# docker run -d --gpus=all -v "$(pwd):/app" -v ollama:/root/.ollama -p 11434:11434 -p 8888:8888 --name container-ollama ollama-bills-agent
# --runtime=nvidia