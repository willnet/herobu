if [ $DAY ] && [ `date +%w` -ne $DAY ]; then
  echo 'today is holiday'
  exit 0
fi

curl -u ${CIRCLE_TOKEN}: \
     -d build_parameters[CIRCLE_JOB]=${JOB} \
     https://circleci.com/api/v1.1/project/github/${PROJECT}/tree/${BRANCH:-master}
