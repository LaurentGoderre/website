#!/bin/bash
start=$(date +%s)
echo -e "Current repo: $TRAVIS_REPO_SLUG\n"

function error_exit
{
	echo -e "\e[01;31m$1\e[00m" 1>&2
	exit 1
}

if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_REPO_SLUG" == "NinthLegionMilsim/website" ] && [ "$TRAVIS_BRANCH" == "master" ]; then

	#Set git user
	git config --global user.email "ninthlegionmilsimbot@gmail.com"
	git config --global user.name "9th Legion Milsim Bot"

	#Add the latest build result
	echo -e "Uploading the build artifacts\n"

	grunt deploy || error_exit "Error running gh-pages task";
fi

end=$(date +%s)
elapsed=$(( $end - $start ))
minutes=$(( $elapsed / 60 ))
seconds=$(( $elapsed % 60 ))
echo "Post-Build process finished in $minutes minute(s) and $seconds seconds"
