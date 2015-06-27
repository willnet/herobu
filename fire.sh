trigger_build_url=https://circleci.com/api/v1/project/${PROJECT}/tree/${BRANCH:-master}?circle-token=${CIRCLE_TOKEN}

post_data='{ "build_parameters": { "BUNDLE_UPDATE": "true" } }'

echo $trigger_build_url

curl \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --data "${post_data}" \
  --request POST ${trigger_build_url}
