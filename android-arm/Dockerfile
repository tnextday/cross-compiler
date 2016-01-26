FROM dimitriss/cross-compiler:base
MAINTAINER dimitriss

RUN apt-get update && apt-get -y --force-yes install \
                        bash \
                        curl \
                        pkg-config \
                        build-essential \
                        file \
                        tar xz-utils bzip2 gzip sed p7zip

ENV CROSS_TRIPLE arm-linux-androideabi
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}

RUN mkdir -p /build && \
    cd /build && \
    curl -L http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin -o android-ndk-r10e-linux-x86_64.bin
RUN cd /build && 7zr x android-ndk-r10e-linux-x86_64.bin
RUN cd /build/android-ndk-r10e && \
    /bin/bash ./build/tools/make-standalone-toolchain.sh --toolchain=arm-linux-androideabi-4.9 --platform=android-19 --install-dir=${CROSS_ROOT} && \
    cd / && \
    rm -rf /build
RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc
