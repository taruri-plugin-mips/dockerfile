FROM mips64le/debian:10.12

LABEL maintainer="tauri-build@tauri-build.cn"

RUN cat <<EOF > /etc/apt/sources.list
deb http://archive.debian.org/debian/ buster main contrib non-free
deb http://archive.debian.org/debian/ buster-updates main contrib non-free
EOF

RUN apt update

RUN apt update && apt install -y --no-install-recommends \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev

RUN echo 'export RUSTUP_DIST_SERVER="https://rsproxy.cn"' >> ~/.bashrc && \
    echo 'export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"' >> ~/.bashrc

RUN source ~/.bashrc

RUN curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- -y --default-toolchain 1.71.0

RUN mkdir -p ~/.cargo && \
    cat <<EOF > ~/.cargo/config
[source.crates-io]
replace-with = 'rsproxy-sparse'

[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"

[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"

[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"

[net]
git-fetch-with-cli = true
EOF
