FROM docker.io/mambaorg/micromamba:1.5-jammy

USER root

COPY environment.yml /opt/conda.yml

RUN micromamba install -y -n base -f /opt/conda.yml \
    && micromamba clean -afy \
    && micromamba env export -n base --explicit > /opt/conda.lock

ENV PATH "${MAMBA_ROOT_PREFIX}/bin:${PATH}"

RUN R -e "install.packages(c('dashboardthemes'), repos='http://cran.rstudio.com/')"
RUN R -e "BiocManager::install('rnaseqDTU')"

USER $MAMBA_USER
