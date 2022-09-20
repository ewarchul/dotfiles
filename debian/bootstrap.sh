sudo apt install -y git gpg gcc-9 g++-9 build-essential automake\
  valgrind npm lldb cmake wget autoconf libtool zlib1g zlib1g-dev\
  libssl-dev rsync sqlite3 libsqlite3-dev libpcre++-dev\
  chromium libkeyutils-dev libselinux1-dev libkrb5-dev\
  libunistring-dev libgss-dev libpsl-dev libssh-dev\
  libcurl4-openssl-dev libnghttp2-dev uuid-dev libncurses5\
  libncurses5-dev libobjc-10-dev libobjc4 libomp5-11\
  libomp-11-dev libsdl2-dev libsm-dev libsndio-dev\
  chrpath icu-devtools libasound2-dev libboost-dev\
  libev-dev libev4 libffi-dev libgles-dev libgles1\
  libglib2.0-dev libglibmm-2.4-dev libglu1-mesa-dev\
  libglx-dev libibus-1.0-dev libice-dev libicu-dev\
  libmount-dev libudev1 libuv1-dev libxml++2.6-2v5\
  libxml2-dev libxml++2.6-dev libxml-libxml-perl\
  libxpm-dev hashdeep git-lfs libgtest-dev libbz2-dev\
  libcap-dev libdbus-1-dev libegl-dev libegl1-mesa-dev\
  libxslt-dev libdbd-sqlite3-perl libspreadsheet-parseexcel-perl\
  libspreadsheet-writeexcel-perl libtext-csv-perl libdbi-perl\
  python3-setuptools python3-empy python3-yaml python3-wheel
  
  
wget https://github.com/hyperrealm/libconfig/archive/refs/tags/v1.7.2.tar.gz
tar xvf v1.7.2.tar.gz
cd libconfig-1.7.2
autoreconf && ./configure && make -j$(nproc) && sudo make install
cd ..

wget https://github.com/protocolbuffers/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
tar xf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
./configure && make -j$(nproc) && sudo make install
cd ..

wget https://github.com/warmcat/libwebsockets/archive/refs/tags/v2.4.2.tar.gz
tar xf v2.4.2.tar.gz
cd libwebsockets-2.4.2
mkdir build && cd build
cmake .. && make -j$(nproc) && sudo make install
cd ..

wget https://github.com/apache/xerces-c/archive/refs/tags/v3.1.1.tar.gz
tar xf v3.1.1.tar.gz
cd xerces-c-3.1.1
./reconf && ./configure --disable-dependency-tracking && make && sudo make install
cd ..
