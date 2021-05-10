resource "helm_release" "tvlk_assessment_2" {
  name       = "tvlk-assessment-2"
  chart      = "../tvlk-assessment-2-chart"
  version    = "0.1.0"

  values = [
    file("../tvlk-assessment-2-chart/values.yaml")
  ]

  set {
    name  = "sample-app.image.repository"
    value = var.sample_app_image_repo
  }

  set {
    name  = "fluentd.output.awsKey"
    value = var.fluentd_output_awsKey
  }

  set {
    name  = "fluentd.output.awsSecret"
    value = var.fluentd_output_awsSecret
  }

#   depends_on = [
#     aws_s3_bucket.tvlk_assessment_2,
#   ]
}