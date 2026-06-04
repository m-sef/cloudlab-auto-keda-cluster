FROM ubuntu:latest

COPY . .

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    conntrack \
    curl \
    docker.io \
    gpg \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    kubeadm \
    kubectl \
    kubelet \
    && rm -rf /var/lib/apt/lists/*
