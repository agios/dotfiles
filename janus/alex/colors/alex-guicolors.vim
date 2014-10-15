set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "alex2"

let ruby_operators = 1

"hi Example         guifg=NONE        guibg=NONE        gui=NONE

" General colors
hi Normal           guifg=#f6f3e8     guibg=#282828     gui=NONE
hi NonText          guifg=#070707     guibg=#282828     gui=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE
hi LineNr           guifg=#505050     guibg=black       gui=NONE

hi VertSplit        guifg=#202020     guibg=black       gui=NONE
hi StatusLine       guifg=#CCCCCC     guibg=black       gui=italic
hi StatusLineNC     guifg=black       guibg=black       gui=NONE

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE
"hi Ignore           guifg=gray        guibg=#282828       gui=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline

hi Directory        guifg=#cccc99     guibg=NONE        gui=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#C6C5FE     gui=BOLD

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#888888     gui=BOLD
  hi CursorColumn   guifg=NONE        guibg=#888888     gui=BOLD
  hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD
  hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE
  hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE
  hi Search         guifg=NONE        guibg=#888800     gui=underline
endif

" Syntax highlighting
hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE
hi String           guifg=#A8FF60     guibg=NONE        gui=NONE
hi Number           guifg=#FF73FD     guibg=NONE        gui=NONE

hi Keyword          guifg=#96CBFE     guibg=NONE        gui=BOLD
hi PreProc          guifg=#96CBFE     guibg=NONE        gui=BOLD
"hi Include          guifg=#C6DBFF     guibg=NONE        gui=BOLD     E
"hi Include          guifg=#FFCCFF      guibg=NONE      gui=NONE
hi Conditional      guifg=#77AADD     guibg=NONE        gui=NONE

hi Todo             guifg=#ff8f8f     guibg=NONE        gui=NONE
hi Constant         guifg=#99EE99     guibg=NONE        gui=NONE

hi Identifier       guifg=#C6C5FE     guibg=NONE        gui=NONE
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE
hi Type             guifg=#FFFF9F     guibg=NONE        gui=NONE
hi Statement        guifg=#77AADD     guibg=NONE        gui=NONE

hi Special          guifg=#E18964     guibg=NONE        gui=NONE
hi Delimiter        guifg=#00A0A0     guibg=NONE        gui=NONE
hi Operator         guifg=white       guibg=NONE        gui=BOLD

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Special for Ruby
hi rubyFunction               guifg=NONE        guibg=NONE        gui=BOLD
hi rubyRegexp                 guifg=#B18A3D     guibg=NONE        gui=NONE
hi rubyRegexpDelimiter        guifg=#FF8000     guibg=NONE        gui=NONE
hi rubyStringDelimiter        guifg=#22AA22     guibg=NONE        gui=BOLD

"hi rubyAccess
"hi rubyArrayDelimiter
"hi rubyBeginEnd
"hi rubyBoolean
"hi rubyClass
"hi rubyClassOrModule
"hi rubyClassVariable
"hi rubyComment
"hi rubyConstant
"hi rubyControl
"hi rubyCurlyBlock
"hi rubyData
"hi rubyDataDirective
"hi rubyDefine
"hi rubyDocumentation
"hi rubyException
"hi rubyExprSubst
"hi rubyGlobalVariable
"hi rubyIdentifier
"hi rubyInclude
"hi rubyInstanceVariable
"hi rubyIterator
"hi rubyKeyword
"hi rubyModule
"hi rubyNumber
"hi rubyOperator
"hi rubyPredefinedConstant
"hi rubyPredefinedIdentifier
"hi rubyPredefinedVariable
"hi rubyRepeatModifier
"hi rubySharpBang
"hi rubyString
"hi rubySymbol
"hi rubyTodo

" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier
hi link javaCommentTitle      javaDocSeeTag
hi link javaDocTags           javaDocSeeTag
hi link javaDocParam          javaDocSeeTag
hi link javaDocSeeTagParam    javaDocSeeTag

hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE


" Special for XML
hi link xmlTag          Keyword
hi link xmlTagName      Conditional
hi link xmlEndTag       Identifier


" Special for HTML
hi link htmlTag         Keyword
hi link htmlTagName     Conditional
hi link htmlEndTag      Identifier


" Special for Javascript
hi link javaScriptNumber      Number


" Special for Python
"hi  link pythonEscape         Keyword


" Special for CSharp
hi  link csXmlTag             Keyword


" Special for PHP
