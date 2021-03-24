function ecr-local-login --argument-names 'profile' 'account' 'region'
  if [ (count $argv) -lt 3 ]
    echo "usage: ecr-local-login <profile> <account> <region>"
    return 1
  end

  echo "aws-vault exec '$profile' -- aws ecr get-login-password --region '$region' | docker login --username AWS --password-stdin '$account.dkr.ecr.$region.amazonaws.com'"
  aws-vault exec "$profile" -- aws ecr get-login-password --region="$region" | docker login --username AWS --password-stdin "$account.dkr.ecr.$region.amazonaws.com"
end
