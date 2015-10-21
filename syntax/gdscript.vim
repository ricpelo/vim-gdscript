" Vim syntax file
" Language: GDScript (Godot Scripting Language)
" Creator: Adam Watson
" Last Revision: 26 May 2015

" If there's already a language file defined, ignore this one

if exists("b:current_syntax")
    finish
endif

" This language is case sensitive

" Keywords
syn keyword     gdConditional   if elif else
syn keyword     gdRepeat        while for
syn keyword     gdOperator      and or not in extends
syn keyword     gdStatement     export func pass return break continue seed assert true false null
syn keyword     gdType          var const int real bool string
" syn match       gdInclude   	"^extends"

syn keyword     gdType          Vector2 Size2 Rect2 Vector3 Matrix32 Plane
syn keyword     gdType          Quat AABB Box3 Matrix3 Transform
syn keyword     gdType          Color Image NodePath RID Object InputEvent
syn keyword     gdType          RawArray IntArray FloatArray StringArray
syn keyword     gdType          Vector2Array Vector3Array ColorArray
syn keyword     gdType          Nil Dictionary Array

syn keyword     gdBuiltin       sign cos tan sinh cosh tanh asin acos atan atan2 sqrt
syn keyword     gdBuiltin       fmod fposmod floor ceil round abs sign pow log exp 
syn keyword     gdBuiltin       isnan isinf ease decimals stepify lerp dectime randomize
syn keyword     gdBuiltin       rand randf randi random seed rand_seed deg2rad rad2deg
syn keyword     gdBuiltin       linear2db db2linear max min clamp nearest_po2 weakref
syn keyword     gdBuiltin       funcref convert typeof str print printt prints printerr
syn keyword     gdBuiltin       printraw var2str str2var range load inst2dict dict2inst
syn keyword     gdBuiltin       hash print_stack instance_from_id float quit get_scene
syn keyword     gdBuiltin       get_root get_node connect add_to_group remove_child
syn keyword     gdBuiltin       add_child move_child free set_process has_animation 
syn keyword     gdBuiltin       play length call_group has_node get_child_count
syn keyword     gdBuiltin       get_child queue_free _input _ready _process _fixed_process

syn keyword     gdTodo          TODO FIXME XXX NOTE NOTES HACK  contained

syn match       gdComment       "\v#.*$" contains=gdTodo

syn match       gdEscapes       /\v\\./ contained
" Highlight strings, skipping special characters
syn region      gdString        start=/\v"/ end=/\v"/ contains=gdEscapes


syn match   gdNumber	"\<0[oO]\=\o\+[Ll]\=\>"
syn match   gdNumber	"\<0[xX]\x\+[Ll]\=\>"
syn match   gdNumber	"\<0[bB][01]\+[Ll]\=\>"
syn match   gdNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   gdNumber	"\<\d\+[jJ]\>"
syn match   gdNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   gdNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   gdNumber
	\ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"


if version >= 508 || !exists("did_gdscript_syn_inits")
    if version <= 508
        let did_gdscript_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink  gdString        String
    HiLink  gdNumber        Number
    HiLink  gdStatement     Keyword
    HiLink  gdRepeat        Repeat
    HiLink  gdConditional   Conditional
    HiLink  gdOperator      Operator
    HiLink  gdBuiltin       Function
    HiLink  gdComment       Comment
    HiLink  gdTodo          ToDo
    HiLink  gdInclude       Include
    HiLink  gdEscapes       Statement
    HiLink  gdType          Type

    delcommand HiLink
endif

let b:current_syntax = "gdscript"
