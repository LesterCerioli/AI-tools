# Installing AI Tools Locally on Debian

## **1. General AI Development Environment**
To set up a general AI/ML environment, install Python and essential libraries.

### **Install Python and Virtual Environment**
```bash
sudo apt update && sudo apt install -y python3 python3-pip python3-venv

#### Create a virtual environment:
```bash
    python3 -m venv ai_env
    source ai_env/bin/activate

```

#### Upgrade pip and install essential AI libraries:
```bash
    pip install --upgrade pip
    pip install numpy pandas scikit-learn tensorflow torch transformers opencv-python matplotlib jupyter

```

## **2. Running Large Language Models (LLMs) Locally
If you want to run AI models like LLaMA, Mistral, or GPT-style models on your machine:
#### Install Ollama (Easy LLM Runtime)
```bash
    curl -fsSL https://ollama.ai/install.sh | sh

```

To run an AI model:
```bash
    ollama pull mistral
    ollama run mistral
```

## ** 3. Running AI Models Using llama.cpp (Optimized for CPU)

If you prefer an open-source alternative:

```bash
    git clone https://github.com/ggerganov/llama.cpp
    cd llama.cpp
    make
```

To run a model:
```bash
    ./main -m models/your_model.gguf -p "Hello, AI!"
```

## **4. Installing OpenAI Whisper for Speech-to-Text
```bash
    pip install openai-whisper
    whisper example.wav --model small
```

## **5. Running Stable Diffusion (Image Generation)
Install dependencies:

```bash
    sudo apt install -y git python3 python3-pip
    
```

Clone and run:

```bash
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
    cd stable-diffusion-webui
    bash webui.sh
    
```

Access it in the browser at http://localhost:7860.