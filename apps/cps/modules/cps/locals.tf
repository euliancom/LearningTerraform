locals {
  region    = "${data.aws_region.current.name}"
  telemetry = "${var.env == "dev" ? "false" : "true" }"

  default_tags = "${map(
    "tr:appFamily", "cps",
    "tr:appName", "cps",
    "tr:appidentifier", "iamapp",
    "ca:owner", "ponnaganti.raghuram@clarivate.com",
    "ca:created-by", "shared-services-terraform",
    "tr:environment-type", "${var.env}",
    "ca:tier", "cps",
    "tr:Role", "cc-content-ingestion"
  )}"
}