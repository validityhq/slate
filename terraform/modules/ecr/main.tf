resource "aws_ecr_repository" "repository" {
  name = var.reponame
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "repo_jenkins_policy" {
  repository = aws_ecr_repository.repository.name
  policy     = file("${path.module}/ecr-jenkins-policy.json")
}

resource "aws_ecr_lifecycle_policy" "repo_lifecycle_policy" {
  repository = aws_ecr_repository.repository.name
  policy     = file("${path.module}/default-lifecycle-policy.json")
}
