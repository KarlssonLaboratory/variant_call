FROM rocker/r-ver:4.4.0

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  less \
  && rm -rf /var/lib/apt/lists/*

# Use Posit Package Manager for faster binary installs
ENV CRAN_REPO="https://packagemanager.posit.co/cran/__linux__/jammy/latest"

# Install CRAN packages
RUN R -e "install.packages(c('data.table', 'vcfR', 'tidyverse'), repos='${CRAN_REPO}')"

WORKDIR /data

CMD ["/bin/bash"]