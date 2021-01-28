curl -k -get https://ticketing.dev/api/users/currentuser
echo
echo

response=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"email":"asdf","password":"sd"}' \
    https://ticketing.dev/api/users/signup
)

jq --color-output <<<"${response}"

response=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"email":"asdf2@asdf.asdf","password":"dfdfdfd"}' \
    https://ticketing.dev/api/users/signup
)

jq --color-output <<<"${response}"

#second time
response=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"email":"asdf2@asdf.asdf","password":"dfdfdfd"}' \
    https://ticketing.dev/api/users/signup
)
jq --color-output <<<"${response}"

response=$(curl -k --request GET https://ticketing.dev/api/users/signup/asdfdfg)
jq --color-output <<<"${response}"

response=$(curl -k --request POST https://ticketing.dev/api/users/fafafafa)
jq --color-output <<<"${response}"
