resource "aws_launch_template" "custom_launch_template" {
  name = "${module.eks.cluster_name}-${var.environment}-eks-custom-lt"
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.launch_template_volume_size
      volume_type = try(var.ebs_volume_type, "gp3")
      delete_on_termination = try(var.ebs_delete_on_termination, true)
      encrypted = try(var.ebs_encrypted, false)
      kms_key_id = try(var.ebs_kms_key_id, null)
      throughput = try(var.ebs_throughput, 125)
      iops = try(var.ebs_iops, 3000)
    }
  }
  user_data = filebase64("${path.module}/configs/custom_userdata.tmpl")
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${module.eks.cluster_name}-node"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "${module.eks.cluster_name}-node-volume"
    }
  }

  tag_specifications {
    resource_type = "network-interface"
    tags = {
      Name = "${module.eks.cluster_name}-node-eni"
    }
  }
}
