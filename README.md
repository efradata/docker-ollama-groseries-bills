# Docker Ollama Groceries Bills

## Description
This project aims to create a chatbot capable of answering questions about grocery expenses stored in a structured database. The workflow involves taking photos of shopping receipts, extracting and storing their data in an organized format, and enabling the chatbot to respond intelligently to queries about expenses, such as total spending, category breakdowns, or purchase history.

---

## Project Structure
The project is organized as follows:

```plaintext
docker-ollama-groceries-bills/
├── Dockerfile                 # File to build the Docker image
├── README.md                  # Project documentation
├── .dockerignore              # Files to ignore in the Docker image
├── data/                      # Folder for data and receipt images
│   ├── raw/                   # Raw, unprocessed data and images
│   ├── processed/             # Processed and structured data
│   └── README.md              # Description of the data folder
├── notebooks/                 # Jupyter notebooks for analysis and prototyping
│   ├── 01_data_exploration.ipynb
│   ├── 02_model_training.ipynb
│   └── README.md              # Explanation of the notebooks
├── src/                       # Source code for the project
│   ├── __init__.py            # Marks this as a Python package
│   ├── data_processing.py     # Scripts for processing receipt data
│   ├── model.py               # Logic for the chatbot and database interaction
│   ├── inference.py           # Code to handle chatbot inference
│   ├── training/              # Subfolder for model training and fine-tuning
│   │   ├── __init__.py
│   │   ├── train.py           # Training or fine-tuning scripts
│   │   ├── utils.py           # Helper functions for training
│   │   └── config.yaml        # Training configuration
│   ├── utils/                 # General utility scripts
│   │   ├── __init__.py
│   │   ├── file_loader.py     # Handles data loading (images, PDFs, etc.)
│   │   └── logger.py          # Configures logging
│   └── README.md              # Source code folder description
├── tests/                     # Unit and integration tests
│   ├── __init__.py
│   ├── test_data_processing.py
│   ├── test_model.py
│   └── README.md              # Test folder description
├── scripts/                   # Executable scripts for automation
│   ├── run_docker.sh          # Script to build and run the Docker container
│   ├── start_training.sh      # Script to initiate model training
│   └── preprocess_data.sh     # Script to preprocess receipt data
├── configs/                   # Project configuration files
│   ├── config.yaml            # General configuration
│   ├── docker/                # Docker-specific configurations
│   │   └── docker-compose.yml
│   └── README.md              # Configuration folder description
├── logs/                      # Folder for execution logs
│   ├── training.log
│   └── inference.log
└── requirements.txt           # Project dependencies
```

# Installation and Setup

Follow these steps to set up and run the project:

## 1. Prerequisites

- **Docker**: Ensure Docker is installed on your system.
- **Python**: Python 3.9 or higher is recommended.
- **Dependencies**: Listed in `requirements.txt`.

## 2. Clone the Repository

```bash
git clone https://github.com/your-username/docker-ollama-groceries-bills.git
cd docker-ollama-groceries-bills
```

## 3. Build the Docker Image

```bash
docker build -t groceries-bills-chatbot .
```

## 4. Run the Docker Container
```bash
docker run -p 8080:8080 groceries-bills-chatbot
```

# Usage
## 1. Data Preprocessing
Place your shopping receipt images in the data/raw/ folder and run the preprocessing script:

```bash
bash scripts/preprocess_data.sh
```

## 2. Model Training
Launch the training process from the src/training/ folder:

```bash
python src/training/train.py
```

## 3. Chatbot Inference
Start the chatbot to interact with your expense data:

```bash
python src/inference.py
```

# Contact
- Author: [Efrain](https://github.com/your-username)
- linkedin: (https://www.linkedin.com/in/efrain-galvis/)
- Email: galvisefrain@gmail.com



