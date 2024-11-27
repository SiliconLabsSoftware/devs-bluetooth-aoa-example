FROM ubuntu:jammy

ARG UID=1000
ARG GID=1000

ENV TZ=Europe/Budapest

#Tested  for x86_64 and aarch64
ARG ARCH=x86_64
ARG SONARQUBE=false

RUN groupadd --gid $GID jenkins
RUN useradd --home /home/jenkins --create-home --shell /bin/sh --uid $UID --gid $GID jenkins

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    software-properties-common \
    gpg-agent && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get install --no-install-recommends -y \
    clang \
    clang-tidy \
    cppcheck \
    git \
    build-essential \
    curl \
    jq \
    python3-dev \
    python3-pip \
    ninja-build \
    make \
    wget \
    zip \
    unzip \
    libgl1 \
    libglib2.0-0 \
    libpcre2-dev \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

#Install newer version of CMake 3.25.4 because Ubuntu 22.04 has 3.16.3

RUN wget https://github.com/Kitware/CMake/releases/download/v3.25.3/cmake-3.25.3-linux-${ARCH}.sh \
    -q -O /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake-3.25.3 \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.25.3 \
    && rm /tmp/cmake-install.sh \
    && ln -s /opt/cmake-3.25.3/bin/* /usr/local/bin

# install GNU Arm Embedded Toolchain
ARG ARM_GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-${ARCH}-arm-none-eabi.tar.xz"
RUN cd /tmp/ \
    && wget "$ARM_GCC_URL" \
    && tar -xf arm-gnu-toolchain-12.2.rel1-${ARCH}-arm-none-eabi.tar.xz \
    && mv arm-gnu-toolchain-12.2.rel1-${ARCH}-arm-none-eabi /opt/gcc-arm-none-eabi \
    && rm arm-gnu-toolchain-12.2.rel-${ARCH}-arm-none-eabi -rf

#install Simplicity Commander
WORKDIR /home/jenkins
RUN wget https://www.silabs.com/documents/login/software/SimplicityCommander-Linux.zip \
    && unzip SimplicityCommander-Linux.zip \
    &&  tar -xf SimplicityCommander-Linux/Commander-cli_linux_${ARCH}_*.tar.bz \
    && mv commander-cli /opt/commander-cli \
    && rm -rf SimplicityCommander-Linux.zip SimplicityCommander-Linux

# Download and install SONARQUBE scanner
RUN if [ "$SONARQUBE" = "true" ]; then \
    curl -L -o /tmp/sonar-scanner-cli.zip -k https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.1.0.4477-linux-x64.zip \
    && unzip /tmp/sonar-scanner-cli.zip -d /opt \
    && ln -s /opt/sonar-scanner-6.1.0.4477-linux-x64/bin/sonar-scanner /usr/local/bin/sonar-scanner \
    && rm /tmp/sonar-scanner-cli.zip; \
    fi

# Download and install build-wrapper
RUN if [ "$SONARQUBE" = "true" ]; then \
    curl -L -o /tmp/build-wrapper-linux-${ARCH}.zip -k https://sonarqube.silabs.net/static/cpp/build-wrapper-linux-x86.zip \
    && unzip /tmp/build-wrapper-linux-${ARCH}.zip -d /opt \
    && ln -s /opt/build-wrapper-linux-x86/build-wrapper-linux-x86-64 /usr/local/bin/build-wrapper \
    && rm /tmp/build-wrapper-linux-${ARCH}.zip; \
    fi

USER jenkins

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV POST_BUILD_EXE="/opt/commander-cli/commander-cli"
ENV ARM_GCC_DIR="/opt/gcc-arm-none-eabi/"
ENV PATH="${PATH}:/opt/gcc-arm-none-eabi/bin"
ENV PATH="${PATH}:/usr/local/bin"

ENV PATH="${PATH}:/opt/build-wrapper-linux-x86/"
WORKDIR /home/jenkins
