set -euox pipefail
cd common
npm install
git add .
git commit -m "updates" || true
npm version patch
npm run clean
npm run build
npm publish --access public
cd ../
cd auth
npm update @procigatto/common --save
npm install
#npm run test
cd ../
cd tickets
npm update @procigatto/common --save
npm install
#npm run test
cd ../
cd client
npm update @procigatto/common --save
npm install
cd ../
cd nats-test
npm update @procigatto/common --save
npm install
cd ../
docker-compose build
docker-compose push
skaffold dev
