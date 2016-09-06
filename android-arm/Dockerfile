FROM dimitriss/cross-compiler:base

# https://developer.android.com/ndk/guides/standalone_toolchain.html

ENV NDK_VERSION r12b
ENV OS_ARCH arm
ENV ANDROID_API 21
ENV CROSS_TRIPLE ${OS_ARCH}-linux-androideabi
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}

RUN apt-get update && apt-get -y install python
RUN mkdir -p /build && \
    cd /build && \
    curl -L -o ndk.zip http://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux-x86_64.zip && \
    unzip ndk.zip && \
    cd /build/android-ndk-${NDK_VERSION} && \
    python ./build/tools/make_standalone_toolchain.py --arch ${OS_ARCH} --api ${ANDROID_API} \
    --stl libc++ --install-dir ${CROSS_ROOT} && \
    cd / && \
    rm -rf /build/*
