return {
    lintCommand = 'poetry run flake8 --stdin-display-name ${INPUT} -',
    lintStdin = true,
	lintFormats = '%f:%l:%c: %m'
}
