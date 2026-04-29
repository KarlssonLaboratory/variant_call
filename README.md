[![Build and Deploy Docker Image](https://github.com/KarlssonLaboratory/variant_call/actions/workflows/build_deploy.yml/badge.svg)](https://github.com/KarlssonLaboratory/variant_call/actions/workflows/build_deploy.yml)

A rocker/r-ver:4.4.0 container with [vcfR](https://github.com/knausb/vcfR) R-package (and some dependencies). Mainly used for variant calling mutagenesis analysis.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

## Included softwares

`vcfR`, `tidyverse`, `data.table`, `clinfun`, `R.utils`, and some system dependencies.

## Include in nextflow process

```groovy
process PROCESS_NAME {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
  	'docker://ghcr.io/karlssonlaboratory/variant_call:c12365a' :
  	'ghcr.io/karlssonlaboratory/variant_call:c12365a'}"

  . . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`

## Pull from GitHub Container Registry

```bash
docker pull ghcr.io/KarlssonLaboratory/variant_call:c12365a
```

## Run interactively

```bash
docker run -it --rm -v $(pwd):/data ghcr.io/KarlssonLaboratory/variant_call:c12365a
```

## Build locally

```bash
git clone https://github.com/KarlssonLaboratory/variant_call:c12365a.git
cd variant_call
docker build -t variant_call .
```
