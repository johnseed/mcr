FROM debian:bullseye-slim
RUN apt -q update && apt install -q -y --no-install-recommends xorg && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD 7z2201-linux-x64.tar.xz /usr/bin/
# https://www.mathworks.com/products/compiler/matlab-runtime.html
COPY MATLAB_Runtime_R2022b_Update_2_glnxa64.zip /mcr-install/
RUN cd /mcr-install && 7zz x -bsp1 MATLAB_Runtime_R2022b_Update_2_glnxa64.zip && ./install -agreeToLicense yes -mode silent && cd / && rm -rf /mcr-install
ENV LD_LIBRARY_PATH=/usr/local/MATLAB/MATLAB_Runtime/R2022b/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2022b/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2022b/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2022b/extern/bin/glnxa64