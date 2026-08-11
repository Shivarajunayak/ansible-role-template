locals {
  attach_policy = var.attach_policy
}

resource "aws_s3_bucket_policy" "this" {
  count = local.attach_policy ? 1 : 0

  bucket = var.bucket
  policy = data.aws_iam_policy_document.combined[0].json

}

data "aws_iam_policy_document" "combined" {
  count = local.attach_policy ? 1 : 0

  source_policy_documents = compact([
    var.attach_policy ? var.policy : ""
  ])
}
