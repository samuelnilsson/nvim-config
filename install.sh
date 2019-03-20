BASEDIR=`pwd $(dirname "$0")`

link_file()
{
	file=$1
	link=$2
	if [ -L "$link" ] || [ -f "$link" ]
	then
		echo "Skipped linking $link since it already exists."
	else
		ln -s "$file" "$link"
	fi
}

copy_file()
{
	file=$1
	copy=$2
	copied=false
	if [ -L "$copy" ] || [ -f "$copy" ]
	then
		echo "Skipped copying $copy since it already exists."
	else
		cp "$file" "$copy"
		copied=true
	fi
}

# Link linter default configurations
link_file $BASEDIR/langconfigs/eslintrc.json $HOME/.eslintrc.json
copy_file $BASEDIR/langconfigs/stylelintrc.json $HOME/.stylelintrc.json
if [ "$copied" = true ]
then
	npmdir="$(npm root -g)"
	jq -c ".extends = \"$npmdir/stylelint-config-recommended\"" $HOME/.stylelintrc.json > tmp.$$.json
	mv tmp.$$.json $HOME/.stylelintrc.json
fi
