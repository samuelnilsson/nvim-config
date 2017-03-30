if exists("b:current_syntax")
  finish
endif

" Load Python syntax at the top level
runtime! syntax/typescript.vim
unlet b:current_syntax

" Load SQL syntax
syn include @SQL syntax/sql.vim

" Reference: https://github.com/krisajenkins/vim-java-sql/blob/master/after/syntax/java.vim
" Take care not to consume the double-quotes (\zs & \ze)
" Case-insensitive (no \C)
syn region SQLEmbedded start=+\z(['"]\)\zs[\s\n]*\v(ALTER|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT)+ skip=+\\\z1+ end=+\ze\z1+ contains=@SQL containedin=typescriptString

let b:current_syntax = "tssql"
