FROM dimitriss/cross-compiler:base

ENV CROSS_TRIPLE arm-linux-androideabi
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
#ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib

RUN mkdir -p /build && \
    cd /build && \
    curl -L http://dl.google.com/android/ndk/android-ndk32-r10b-linux-x86_64.tar.bz2 | tar xvj && \
    cd /build/android-ndk-r10b && \
    /bin/bash ./build/tools/make-standalone-toolchain.sh --platform=android-19 --install-dir=${CROSS_ROOT} && \
    cd / && \
    rm -rf /build

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc