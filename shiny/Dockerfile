FROM docker.io/rocker/shiny-verse:4.3.3

# set environment
ENV PIXI_HOME=/usr/local PIXI_HOME=/usr/local PIXI_CACHE_DIR=/tmp/pixi RENV_PATHS_LIBRARY=/opt/renv/library

# install pixi to resolve conda dependencies
# TODO: figure out what those are
ADD --chmod=700 https://github.com/prefix-dev/pixi/releases/download/v0.15.2/pixi-x86_64-unknown-linux-musl /usr/local/bin/pixi

# configure posit binary repos
RUN printf '%s\n' \
 'options(BioC_mirror = "https://packagemanager.posit.co/bioconductor")' \
 'options(BIOCONDUCTOR_CONFIG_FILE = "https://packagemanager.posit.co/bioconductor/config.yaml")' \
 'options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/jammy/latest"))'>> /usr/local/lib/R/etc/Rprofile.site

# install renv
RUN install2.r --deps TRUE --error --skipinstalled renv

# restore renv
WORKDIR /opt

COPY renv.lock /opt/renv.lock

RUN R -e "renv::restore()"
