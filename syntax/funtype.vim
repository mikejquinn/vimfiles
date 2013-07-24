" Vim syntax file
" Language:	FUN (for iOS)
" Maintainer:	James Reichley
" Last Change:	2012 Oct 24

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword	funUser			setProp setProps getProp createNative class
syn keyword	funUser			performSelector addSubview rect size image array
syn keyword	funUser			strcmp add subtract multiply divide point
syn keyword	funUser			pushViewController controllerWithView colorWithName
syn keyword	funUser			numLessThan numGreaterThan numEqualTo
syn keyword	funUser			each map head tail createBackgroundView

syn keyword	funMacro		or and if then else cond eval return
syn keyword	funVarScope		global local
syn keyword	funParameterized	voidBlock boolBlock block function

syn keyword	funBoolean		true false
syn keyword	funValue		nullValue
syn match	funValue		/\W\-\?[0-9]\+\(\.[0-9]\+\)\?\>/
syn match	funValue		/\<[A-Z_]\+\>/

syn match	funTodo			/...\sTODO:\?/ contained
syn match	funComment		";.*$" contains=funTodo

syn region	funString		start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/

syn region	funCapture		start="\(\(block\|function\)\)\@<=.*" end="\([^)]*\)" contains=parameterized,funParams
syn match	funParams		"[a-zA-Z0-9_]\+" contained skipwhite

syn region	funCapture		start="\(\(global\|local\)\)\@<=.*" end="[;(\n]" contains=funVarScope,funIdentifier
syn match	funIdentifier		"[a-zA-Z0-9_]\+" contained skipwhite

syn match	funMethodDesc		";;\s.\+$"
syn match	funMethodSig		";;\sfunction\s\?(.\+)\s\?->\s\?.\+$" 

syn match	funParens		"[()]"


if version >= 508 || !exists("did_fun_syntax_inits")
  if version < 508
    let did_fun_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink funUser		UserDefined
  HiLink funMacro		Statement
  HiLink funVarScope		Statement
  HiLink funParameterized	Function
  HiLink funBoolean		Boolean
  HiLink funValue		Boolean
  HiLink funComment		Comment
  HiLink funTodo		Todo
  HiLink funString		String
  HiLink funCapture		Special
  HiLink funParams		Underlined
  HiLink funIdentifier		Identifier
  HiLink funMethodSig		StatusLine
  HiLink funMethodDesc		Ignore
  HiLink funParens		Special

  delcommand HiLink
endif

let b:current_syntax = "funtype"
