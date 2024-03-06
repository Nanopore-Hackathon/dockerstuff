FROM docker.io/mambaorg/micromamba:1.4.2-jammy

LABEL org.opencontainers.image.authors="imbforge" \
      org.opencontainers.image.title="bowtie" \
      org.opencontainers.image.version="1.3.1" \
      org.opencontainers.image.revision="r0"

USER root

COPY environment.yml /opt/conda.yml

RUN micromamba install -y -n base -f /opt/conda.yml \
    && micromamba clean -afy \
    && micromamba env export -n base --explicit > /opt/conda.lock

ENV PATH "${MAMBA_ROOT_PREFIX}/bin:${PATH}"

USER $MAMBA_USER