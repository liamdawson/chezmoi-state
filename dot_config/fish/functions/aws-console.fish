if type -q aws-vault
  function aws-console --argument-names 'profile' --description "Open the AWS Console (for an aws-vault profile) in a Firefox Container tab"
    set -e argv[1]
    set -l leftover_args $argv

    set -l login_url (aws-vault login "$profile" --stdout $leftover_args) || return $status
    set -l encoded_url (string replace --all '&' '%26' "$login_url")
    set -l firefox_uri "ext+container:name=$profile&url=$encoded_url"

    if test -x /Applications/Firefox.app/Contents/MacOS/firefox
      /Applications/Firefox.app/Contents/MacOS/firefox "$firefox_uri"
    else
      echo "error: unknown Firefox path" >&2
      echo "$firefox_uri"

      return 1
    end
  end

  complete -ec aws-console

  complete -c aws-console -xa '(aws-vault list --profiles)'
end
