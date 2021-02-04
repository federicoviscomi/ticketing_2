set -euox pipefail

# common
cd common
npm install
git add .
git commit -m "updates" || true
npm version patch
npm run clean
npm run build
npm publish --access public
cd ../

#auth
cd auth
npm update @procigatto/common --save
npm install
npm run test
cd ../

#tickets
cd tickets
npm update @procigatto/common --save
npm install
npm run test
cd ../

#client
cd client
npm update @procigatto/common --save
npm install
cd ../

#nats-test
cd nats-test
npm update @procigatto/common --save
npm install
cd ../

docker-compose build

docker-compose push

skaffold dev
