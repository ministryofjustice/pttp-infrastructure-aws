resource "aws_iam_policy" "cloudtrail_policy" {
  name   = "${var.prefix}-cloudtrail-policy"
  policy = data.template_file.cloud_trail_cloud_watch_policies.rendered
}

data "template_file" "cloud_trail_cloud_watch_policies" {
  template = file("${path.module}/policies/cloudTrailCloudwatchPolicies.json")

  vars = {
    log_group_arn = aws_cloudwatch_log_group.cloudwatch_log_group.arn
  }
}
