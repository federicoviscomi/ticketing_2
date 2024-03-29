set -euox pipefail

#echo
#echo
#echo -----------
#echo COMMON
#cd common
#echo "changes in common"
#npm install
#git add .
#git commit -m "updates" || true
#npm version patch
#npm run clean
#npm run build
#npm publish --access public
#cd ../

echo
echo
echo -----------
echo AUTH
cd auth
npm update @procigatto/common --save
npm install
npm run test
cd ../

echo
echo
echo -----------
echo TICKETS
cd tickets
npm update @procigatto/common --save
npm install
npm run test
cd ../

echo
echo
echo -----------
echo ORDERS
cd orders
npm update @procigatto/common --save
npm install
npm run test
cd ../

echo
echo
echo -----------
echo CLIENT
cd client
npm update @procigatto/common --save
npm install
cd ../

echo
echo
echo -----------
echo NATS TEST
cd nats-test
npm update @procigatto/common --save
npm install
cd ../

docker-compose build

docker-compose push

skaffold dev
