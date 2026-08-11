resource "aws_ecr_repository" "ecr" {
  for_each = var.repositories
  name     = each.key
  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = try(var.force_delete, false)
  image_tag_mutability = try(var.image_tag_mutability, "IMMUTABLE")
  encryption_configuration {
    
      encryption_type = try(var.encryption_type, "AES256")
      kms_key         = try(var.kms_key, "")
  }
}

data "aws_iam_policy_document" "ecr_cross_account_policy" {
  for_each = var.repositories
  statement {
    sid    = "AllowCrossAccountPushPull"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = try(each.value.allowed_accounts, var.allowed_accounts, local.allowed_accounts)
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]
  }
}

resource "aws_ecr_repository_policy" "ecr_cross_account_policy" {
  for_each   = var.repositories
  repository = aws_ecr_repository.ecr[each.key].name
  policy     = data.aws_iam_policy_document.ecr_cross_account_policy[each.key].json
}



resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  for_each   = var.repositories
  repository = aws_ecr_repository.ecr[each.key].name

  policy = try(var.lifecycle_policy_rules[each.key], var.default_lifecycle_policy)
  
}
