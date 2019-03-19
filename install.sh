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

# Link linter default configurations
link_file $BASEDIR/langconfigs/stylelintrc.json $HOME/.stylelintrc
link_file $BASEDIR/langconfigs/eslintrc.json $HOME/.eslintrc.json
