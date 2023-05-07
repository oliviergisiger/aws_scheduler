#!/bin/bash

newExpirationTime=$(($(date +%s) + 84600))

curl 'https://labs.vocareum.com/util/vcput.php?a=getaws&type=1&stepid=1569028&version=0&v=0&vockey=rUvDz4fZExx3whMjpx7S%2Bg%3D%3D' \
  -H 'authority: labs.vocareum.com' \
  -H 'accept: */*' \
  -H 'accept-language: de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'cookie: userid=2428323; usingLTI=1; vocuserid=2428323; myfolder=5bdbb6c1e99eed3754a27e43cbd1721f; currentcourse=vc_2_0_11992abdorg265_304; currentassignment=1569027; logintoken=5d88c860688dda17ec6dbf86d4387fad; tokenExpire="'$newExpirationTime'"; usertoken=5d88c860688dda17ec6dbf86d4387fad; t2fausers=5d88c860688dda17ec6dbf86d4387fad' \
  -H 'referer: https://labs.vocareum.com/main/main.php?m=clabide&mode=s&asnid=1569027&stepid=1569028&hideNavBar=1' \
  -H 'sec-ch-ua: "Chromium";v="112", "Google Chrome";v="112", "Not:A-Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36' \
  -H 'x-requested-with: XMLHttpRequest' \
  --compressed | head -c 1000 | sed 's/.*break-word;">//; s/<\/span>.*//' > /.aws/credentials

cp /.aws/credentials /home/ubuntu/.aws/credentials
