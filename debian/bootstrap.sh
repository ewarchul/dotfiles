sudo apt install -y apt install -y git gpg gcc g++ build-essential automake valgrind cmake wget autotoconf libtool zlib1g zblig1-dev libssl-dev rsync sqlite3 libsqlite3-dev libpcre++-dev chromium libkeyutils-dev libselinux1-dev libkrb5-dev libunistring-dev libgss-dev libpsl-dev libssh-dev libcurl4-openssl-dev libnghttp2-dev uuid-dev libncurses5 python3-setuptools python3-empy python3-yaml python3-wheel

wget https://github.com/hyperrealm/libconfig/archive/refs/tags/v1.7.2.tar.gz
tar xvf v1.7.2.tar.gz
cd libconfig-1.7.2
autoreconf && ./configure && make -j$(nproc) && make install
cd ..

wget https://github.com/protocolbuffers/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
tar xf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
./configure && make -j$(nproc) && make install
cd ..

wget https://github.com/warmcat/libwebsockets/archive/refs/tags/v2.4.2.tar.gz
tar xf v.2.4.2.tar.gz
cd libwebsockets-2.4.2
mkdir build && cd build
cmake .. && make -j$(nproc) && make install
cd ..

wget https://github.com/apache/xerces-c/archive/refs/tags/v3.1.1.tar.gz
tar xf v3.1.1.tar.gz
cd xerces-c-3.1.1
./reconf && ./configure --disable-dependency-tracking && make && make install
cd ..

git clone https://gitlab.com/lely_industries/lely-core.git
cd lely-core
autoreconf -i
mkdir -p build
cd build
../configure --disable-cython
make && make install
