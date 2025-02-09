FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install system dependencies
RUN apt update && apt install -y \
    python3 python3-pip python3-venv git curl wget \
    build-essential cmake libssl-dev \
    ffmpeg libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Set up Python virtual environment
WORKDIR /app
RUN python3 -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install numpy pandas scikit-learn tensorflow torch transformers opencv-python matplotlib jupyter openai-whisper

# Install Ollama (for LLMs)
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Install LLaMA.cpp
RUN git clone https://github.com/ggerganov/llama.cpp /app/llama.cpp && \
    cd /app/llama.cpp && \
    make

# Install Stable Diffusion WebUI
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /app/stable-diffusion-webui

# Install additional dependencies for Stable Diffusion
RUN cd /app/stable-diffusion-webui && \
    bash webui.sh

# Expose ports for Jupyter Notebook and Stable Diffusion
EXPOSE 7860 8888

# Default command to start a bash shell
CMD ["/bin/bash"]