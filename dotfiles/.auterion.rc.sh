ecr-login() {
  arn="arn:aws:iam::545794207414:role/AuterionSuiteGlobalAdmin"
  session=$(aws sts assume-role --role-arn "$arn" --role-session-name 'encrypt-secret')
  export AWS_ACCESS_KEY_ID="$(echo $session | jq -r '.Credentials.AccessKeyId')"
  export AWS_SECRET_ACCESS_KEY="$(echo $session | jq -r '.Credentials.SecretAccessKey')"
  export AWS_SESSION_TOKEN="$(echo $session | jq -r '.Credentials.SessionToken')"
  export AWS_EXPIRATION="$(echo $session | jq -r '.Credentials.Expiration')"

  $(aws ecr get-login --no-include-email --region=eu-central-1)
}

