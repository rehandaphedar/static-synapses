#!/usr/bin/env bash

SSP_BASEDIR="content/posts"
SSP_HEADING="# Similar Posts"
SSP_HEADING_REGEX='/^# Similar Posts$/,$d' # This regex should delete everything after the $SSP_HEADING
SSP_MAX_RECOMMENDATIONS=5
SSP_MIN_THRESHOLD=0.1

cd "$SSP_BASEDIR"

for post in *.md;
do
	sed -i "$SSP_HEADING_REGEX" "$post"
	echo "$SSP_HEADING" >> "$post"
	for similar_post in $(findlike -Rh "$post" -t $SSP_MIN_THRESHOLD -m $SSP_MAX_RECOMMENDATIONS);
	do
		title=$(yq --front-matter=extract .title "$similar_post")
		echo "- [$title]({{< relref $similar_post >}})" >> "$post"
	done
done
