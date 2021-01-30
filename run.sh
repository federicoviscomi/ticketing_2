set -euox pipefail
cd auth
npm update @procigatto/common --save
npm install
cd ../
cd client
npm update @procigatto/common --save
npm install
cd ../
cd common
git add .
git commit -m "updates" || true
npm version patch
npm run clean
npm run build
npm publish --access public
cd ../
docker-compose build
docker-compose push
skaffold dev
