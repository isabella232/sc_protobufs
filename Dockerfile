FROM swift:3.1

# Install required dependencies
RUN apt-get -q update && \
    apt-get -q install -y \
    python-pip \
    wget \
    unzip && \
    pip install Flask && \
    rm -r /var/lib/apt/lists/*

# Install protoc
RUN wget https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip && \
    unzip protoc-3.3.0-linux-x86_64.zip && \
    mv bin/protoc /usr/local/bin && \
    pip install protobuf --ignore-installed six

# Build and install swift-protoc
RUN git clone https://github.com/apple/swift-protobuf.git && \
    cd swift-protobuf && \
    git checkout tags/0.9.902 && \
    swift build && \
    cp .build/debug/protoc-gen-swift /usr/local/bin

WORKDIR /opt

EXPOSE 5000

CMD ["bash"]
