// GitHub reference as defined in GitHub Actions (eg. refs/head/master))
#------------------------------------------------------------------
# Variables
#------------------------------------------------------------------

variable "GITHUB_REF" {
  default = ""
}

variable "REPO_SLUG" {
  default = "navisidhu"
}

#------------------------------------------------------------------
# Common
#------------------------------------------------------------------

target "_common" {
  context = "images"
  labels = {
    "org.opencontainers.image.authors" = "Navdeep Sidhu",
    "org.opencontainers.image.vendor"  = "Navdeep Sidhu",
  }
  args = {
    GIT_REF = GITHUB_REF
  }
  platforms = [
    // "darwin/amd64",
    // "darwin/arm64",
    "linux/amd64",
    // "linux/arm/v6",
    // "linux/arm/v7",
    "linux/arm64",
    // "linux/ppc64le",
    // "linux/riscv64",
    // "linux/s390x",
    // "windows/amd64",
    // "windows/arm64"
  ]
}

#------------------------------------------------------------------
# Default
#------------------------------------------------------------------

group "default" {
  targets = ["base"]
}

target "base" {
  dockerfile = "images/Base.Dockerfile"
  inherits   = ["_common"]
  tags       = ["${REPO_SLUG}/base:latest"]
}