function ecr-local-login --argument-names 'profile' 'account' 'region'
  aws-vault exec "$profile" -- aws ecr get-login-password --region="$region" | docker login --username AWS --password-stdin "$account.dkr.ecr.$region.amazonaws.com"
end
