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
signin=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    -c cookies/signin_cookie.txt \
    --data '{"email":"as33df2@asdf.asdf","password":"dfdfdfd"}' \
    https://ticketing.dev/api/users/signin
)
jq --color-output <<<"${signin}"
getOrders=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request GET \
    -b cookies/signin_cookie.txt \
    https://ticketing.dev/api/orders
)
jq --color-output <<<"${getOrders}"

createTicket=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    -b cookies/signin_cookie.txt \
    --data '{"title":"concert","price":"10000"}' \
    https://ticketing.dev/api/tickets/
)
jq --color-output <<<"${createTicket}"
id=$(jq <<<"${createTicket}" | grep id | cut -c 10- | cut -c -24)

getTicket=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request GET \
    -b cookies/signin_cookie.txt \
    https://ticketing.dev/api/tickets/${id}
)
jq --color-output <<<"${getTicket}"

#the order service is not going to find
#the given ticket because the events part
#of the project has not been implemented yet!
set -x
createOrder=$(
  curl -k \
    --header "Content-Type: application/json" \
    --request POST \
    -b cookies/signin_cookie.txt \
    --data '{"ticketId":"'${id}'"}'\
    https://ticketing.dev/api/orders
)
jq --color-output <<<"${createOrder}"
set +x