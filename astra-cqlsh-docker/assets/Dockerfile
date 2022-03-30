FROM python

ENV CQLSH_HOME /root

# Install wget
RUN set -x \
    apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && mkdir -p "$CQLSH_HOME" \
# Download CQL shell tarball
    && wget https://downloads.datastax.com/enterprise/cqlsh-astra.tar.gz \
# Unpack tarball
    && tar xvzf cqlsh-astra.tar.gz --directory ${CQLSH_HOME} \
    && rm -f cqlsh-astra.tar.gz

ENV HOME $CQLSH_HOME
ENV PATH $PATH:${CQLSH_HOME}/cqlsh-astra/bin
WORKDIR $HOME

COPY cqlsh_run.sh $WORKDIR
ENTRYPOINT ["./cqlsh_run.sh"]
