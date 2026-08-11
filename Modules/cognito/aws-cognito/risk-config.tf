resource "aws_cognito_risk_configuration" "example" {
  user_pool_id  = aws_cognito_user_pool.pool[0].id

  compromised_credentials_risk_configuration {
    actions {
      event_action = "BLOCK"
    }
  }

}

