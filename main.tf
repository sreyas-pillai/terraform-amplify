provider "aws" {
  region = "ap-south-1"
}

# resource "aws_amplify_app" "bitsight_amp" {
#   name          = "bitsight-amp-123"
#   repository    = "https://github.com/Bluepineapple-io/bitsight-amp-frontend.git"
#   access_token = "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"
# #   build_settings = {
# #     branch_name = "main"
# #   }
# }



# aws_amplify_app.bitsight_amp_test will be updated in-place
resource "aws_amplify_app" "bitsight_amp_test" {
  name         = "bitsight-amp-123456"
  repository   = "https://github.com/Bluepineapple-io/bitsight-amp-frontend"
  access_token = "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"
  # branch_name = "main"
  
  custom_rule {
    source = "/<*>"
    status = "404-200"
    target = "/index.html"
  }
  custom_rule {
    source = "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json)$)([^.]+$)/>"
    status = "200"
    target = "/index.html"
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.bitsight_amp_test.id
  branch_name = "main"

  # enable_basic_auth      = true
  # basic_auth_credentials = base64encode("username:password")
}
