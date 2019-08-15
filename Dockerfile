FROM homdx/qt-android-docker

ARG ADBCACHE_VERSION=v1.0.3
ARG ADBCACHE_HASH=e947d10b5d69b63eb0c852d756fa025a8512ce4a2ec9378f381ba6b0fcfe2aa88fc17dd9b2ab3f8e34063b394797df1524d3c7bd2ca3f80b9f8021bc8039687a
ARG ADBCACHEFILE=adbkey.tar.gz

RUN cd /root && set -ex && curl -s -L -o adbkey.tar.gz https://github.com/homdx/qt-rssnews/releases/download/${ADBCACHE_VERSION}/${ADBCACHEFILE} \
    && echo "${ADBCACHE_HASH}  adbkey.tar.gz" | sha512sum -c \
    && tar -xvf adbkey.tar.gz \
    && ls -la adbkey.tar.gz && cd ..

ARG projname=qt-view
ARG profile=qt-stackview.pro

RUN cd / && git clone https://github.com/homdx/android_openssl.git && cd /android_openssl && git checkout 5.12.4_5.13.0 && \
    mkdir /app && cd /app && export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && git clone https://github.com/homdx/${projname} && cd ${projname}/src && cp -vf ${profile}.buildapk ${profile} && \
    build-android-gradle-project ${profile} --debug && \
    echo 'fix missing libc++_shared.so' && cp -vf /android-ndk-r17c/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_shared.so android-build/libs/armeabi-v7a/ && \
    build-android-gradle-project ${profile} --debug && \
    echo copy result apk && \
    cp -vf /app/${projname}/src/android-build/build/outputs/apk/debug/android-build-debug.apk /app

RUN echo fix for upgrade version && cd /root && tar -xf adbkey.tar.gz && cd /app/${projname}/src && make clean && rm -rf android-build && export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run2 && build-android-gradle-project ${profile} --debug && \
    echo 'fix missing libc++_shared.so' && cp -vf /android-ndk-r17c/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_shared.so android-build/libs/armeabi-v7a/ && \
    build-android-gradle-project ${profile} --debug && \
    echo copy result apk && \
    cp -vf /app/${projname}/src/android-build/build/outputs/apk/debug/android-build-debug.apk /app


CMD tail -f /var/log/faillog
