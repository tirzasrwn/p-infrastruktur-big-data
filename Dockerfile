FROM jupyter/pyspark-notebook

USER root

# Unduh Hadoop versi 3.2.1 dan konfigurasikan
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz && \
    tar -xzf hadoop-3.2.1.tar.gz -C /usr/local/ && \
    mv /usr/local/hadoop-3.2.1 /usr/local/hadoop && \
    rm hadoop-3.2.1.tar.gz

# Konfigurasi environment variables untuk Hadoop
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# Menambahkan environment variables untuk token Jupyter
ENV JUPYTER_TOKEN=utdi

# Bersihkan cache untuk menghemat space
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/jovyan/work && chown -R jovyan:users /home/jovyan/work
