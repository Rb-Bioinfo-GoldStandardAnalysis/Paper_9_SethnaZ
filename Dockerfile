FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install nano curl -y

# Install stuf
RUN apt update && apt install -y --no-install-recommends \
    software-properties-common \
    dirmngr \
    gpg \
    curl \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    make \
    cmake \
    gfortran \
    libxt-dev \
    liblapack-dev \
    libblas-dev \
    libsqlite3-dev


# Python
RUN apt update && apt install -y wget \
    && wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz \
    && tar -xvzf Python-3.11.6.tgz \
    && cd Python-3.11.6 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.11.6 Python-3.11.6.tgz

# Install pip and venv
RUN apt install -y python3-pip python3-venv

# Create a virtual environment
RUN python3.11 -m venv /opt/venv

# Activate virtual environment and install JupyterLab
RUN /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install jupyterlab

# Set the virtual environment as the default Python path
ENV PATH="/opt/venv/bin:$PATH"






# Python libraries
#RUN pip install -r sethna_rna_neoantigens_python_libraries.txt
RUN pip install numpy scipy matplotlib





# Cell Ranger
#RUN cd /
#RUN mkdir yard
#RUN cd yard
#RUN mkdir /yard/apps
#RUN cd /yard/apps
#RUN curl -o cellranger-6.0.2.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.0.2.tar.gz?Expires=1745897506&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=ol3ky15f3CevMFtG5w1SkIyhMtc7Dqr2y7zfoDoHonjOk-3kMxbxIKDtpxTM1qM7Usp9Cb0BfVL~PKfLB5km-Vrm0wZcfzFzL02L3dGFc0Xwhyq9WC0ppNyEEttHRmEYJ3E6nN70j9SosW0FTwuhVar4fYPcCPNYzxSLfIVyb2KQCzSKu4KLLUjaOYxyg4HddYnt0tbIIBNPWhQO54Md7dKl23ITKBRH1epK0BIzUe7OruqOeM-XjTwkqkGf~cjNc~-NcwBGzkE~UKEXOEGDf85lDPR30LzJmMsh7M5PNS~T0XUZG0dq1hH2gbkGQx16LPiaKc8DJg1~UHucnYeoCQ__"
#RUN tar -zxvf cellranger-6.0.2.tar.gz
#RUN cd cellranger-6.0.2
#RUN PATH=.:$PATH



#RUN cd /





















ENV SHELL=/bin/bash

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.allow_origin='*' --ServerApp.token='' #last one disables the token
#CMD ["/bin/bash"]
