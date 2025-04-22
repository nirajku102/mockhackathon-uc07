provider "aws" {
  region = "eu-north-1"
}

resource "aws_ecr_repository" "patient_service" {
  name = "patient-service"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "appointment_service" {
  name = "appointment-service"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}