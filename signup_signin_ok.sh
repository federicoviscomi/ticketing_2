mkdir cookies
signup=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"email":"as33df2@asdf.asdf","password":"dfdfdfd"}' \
    -c cookies/signup_cookie.txt \
    https://ticketing.dev/api/users/signup
)
jq --color-output <<<"${signup}"
cat cookies/signup_cookie.txt
signin=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    -c cookies/signin_cookie.txt \
    --data '{"email":"as33df2@asdf.asdf","password":"dfdfdfd"}' \
    https://ticketing.dev/api/users/signin
)
jq --color-output <<<"${signin}"
cat  cookies/signin_cookie.txt
current=$(
  curl -k\
       --header "Content-Type: application/json" \
       --request GET\
       -b cookies/signin_cookie.txt\
       https://ticketing.dev/api/users/currentuser
)
jq --color-output <<<"${current}"
currentNoCookie=$(
  curl -k\
       --header "Content-Type: application/json" \
       --request GET\
       https://ticketing.dev/api/users/currentuser
)
jq --color-output <<<"${currentNoCookie}"
