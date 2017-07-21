FROM python:2
ARG DEBIAN_FRONTEND=noninteractive

# USER root
RUN echo "Australia/Sydney" > /etc/timezone
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y build-essential && \
    useradd -ms /bin/bash scientist
RUN apt-get install -y tzdata && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y postgresql-client && \
    apt-get install -y build-essential && \
    apt-get install -y libpq-dev python-dev
RUN apt-get install -y graphviz
RUN apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern
RUN apt-get install -y pandoc
RUN pip install --upgrade pip
RUN pip install psycopg2 && \
    pip install PyWavelets && \
    pip install GPy && \
    pip install plotly && \
    pip install bokeh && \
    pip install seaborn && \
    pip install pydot graphviz
RUN pip install edward
RUN pip install matplotlib ipython jupyter pandas patsy
RUN pip install tensorflow

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

USER scientist
RUN python -c "import matplotlib"
COPY jupyter_notebook_config.py /home/scientist/.jupyter/jupyter_notebook_config.py
COPY run-server /home/scientist/run-server
RUN mkdir /home/scientist/files


EXPOSE 8888
EXPOSE 6006
WORKDIR /home/scientist/files

CMD ["/bin/bash", "/home/scientist/run-server"]
