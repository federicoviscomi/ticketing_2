set -euox pipefail

echo
echo
echo -----------
echo COMMON
cd common
UPDATE_COMMON="true"
if ! git diff-index --quiet HEAD --; then
  echo "changes in common"
  npm install
  git add .
  git commit -m "updates" || true
  npm version patch
  npm run clean
  npm run build
  npm publish --access public
  UPDATE_COMMON="true"
else
  echo "no changes in common"
fi
cd ../

echo
echo
echo -----------
echo AUTH
cd auth
if [[ "${UPDATE_COMMON}" == "true" ]]; then
  npm update @procigatto/common --save
fi
if ! git diff-index --quiet HEAD --; then
  npm install
  npm run test
fi
cd ../

echo
echo
echo -----------
echo TICKETS
cd tickets
if [[ "${UPDATE_COMMON}" == "true" ]]; then
  npm update @procigatto/common --save
fi
if ! git diff-index --quiet HEAD --; then
  npm install
  npm run test
fi
cd ../

echo
echo
echo -----------
echo ORDERS
cd orders
if [[ "${UPDATE_COMMON}" == "true" ]]; then
  npm update @procigatto/common --save
fi
if ! git diff-index --quiet HEAD --; then
  npm install
  npm run test
fi
cd ../

echo
echo
echo -----------
echo CLIENT
cd client
if [[ "${UPDATE_COMMON}" == "true" ]]; then
  npm update @procigatto/common --save
fi
if ! git diff-index --quiet HEAD --; then
  npm install
fi
cd ../

echo
echo
echo -----------
echo NATS TEST
cd nats-test
if [[ "${UPDATE_COMMON}" == "true" ]]; then
  npm update @procigatto/common --save
fi
if ! git diff-index --quiet HEAD --; then
  npm install
fi
cd ../

docker-compose build

docker-compose push

skaffold dev
