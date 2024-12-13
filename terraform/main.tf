resource "aws_apprunner_service" "hello_world" {
  service_name = "hello-world"

  source_configuration {
    image_repository {
      image_configuration {
        port = "8080"
      }

      image_identifier      = "943566097936.dkr.ecr.ap-northeast-1.amazonaws.com/hello-world:0.1.1"
      image_repository_type = "ECR"
    }

    authentication_configuration {
      access_role_arn = "arn:aws:iam::943566097936:role/service-role/AppRunnerECRAccessRole"
    }

    auto_deployments_enabled = false
  }

  instance_configuration {
    cpu    = "256"
    memory = "512"
  }
}
