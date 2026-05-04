[![Build and Deploy Docker Container](https://github.com/KarlssonLaboratory/variant_call/actions/workflows/build_deploy.yml/badge.svg)](https://github.com/KarlssonLaboratory/variant_call/actions/workflows/build_deploy.yml)

A rocker/r-ver:4.4.0 container with [vcfR](https://github.com/knausb/vcfR) R-package (and some dependencies). Mainly used for variant calling mutagenesis analysis.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

<details>
  <summary>Included softwares</summary>

+ vcfR
+ tidyverse
+ data.table
+ clinfun
+ R.utils
+ git
+ less
</details>

## Pull the container

```sh
# As docker
docker pull ghcr.io/karlssonlaboratory/variant_call:530cf28

# As apptainer
apptainer pull docker://ghcr.io/karlssonlaboratory/variant_call:530cf28

# As singularity
singularity pull docker://ghcr.io/karlssonlaboratory/variant_call:530cf28
```

## Run interactively

```sh
docker run -it --rm -v $(pwd):/data ghcr.io/karlssonlaboratory/variant_call:530cf28
```

## Build locally

```sh
git clone https://github.com/karlssonlaboratory/variant_call:530cf28.git
cd variant_call
docker build -t variant_call .
```


<details>
  <summary>As nextflow process</summary>

```groovy
process PROCESS_NAME {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
  	'docker://ghcr.io/karlssonlaboratory/variant_call:530cf28' :
  	'ghcr.io/karlssonlaboratory/variant_call:530cf28'}"

  . . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`
</details>