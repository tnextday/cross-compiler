FROM dimitriss/cross-compiler:base

ENV CROSS_TRIPLE x86_64-linux-gnu
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}

RUN mkdir -p ${CROSS_ROOT} && \
    cd /usr/bin && \
    ln -sf ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc && \
    ln -sf ${CROSS_TRIPLE}-g++ ${CROSS_TRIPLE}-c++ && \
    for i in strip objdump; do \
        ln -sf ${i} ${CROSS_TRIPLE}-${i} ; \
    done && \
    for i in ranlib nm ar; do \
        ln -sf ${CROSS_TRIPLE}-gcc-${i}-4.9 ${CROSS_TRIPLE}-${i} ; \
    done
