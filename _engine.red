include %environment/console/CLI/input.red

; #!/usr/bin/env rebol
; #!/usr/bin/boron

Red [
    title: "Terminal app template"
    desc:{
        ""
    }
]

; #include %environment/console/CLI/input.red


print "CLI_ENgiNE"
print "..........................."

;======================================;
;     Loading Configuration file
;======================================;
files: []
do %configs.red
;----- load files
foreach file files [
    print [file "Loading....." ":Success"]
    do to-file file
]

print "Files loaded success"
print "..........................."
;---- test run a library runction ---;
; print_this "hello"
;=============================
; Commands => Functions
;=============================
commands: ["hello_world" "hx" "print_this"]
print ["Commands: " commands]
print "..........................."
;=============================
; Message Block
;=============================
message_block: function [str][
    print "===================================="
    print ["     " str ""]
    print "------------------------------------"
]
;
message_block "Starting...."
;=============================
; Shell renderer
;=============================
shell_renderer: function [] [
    c: ask "> " 
    ; print ["Command:" c]
    command_runner c
    if equal? c "exit" [
       message_block "Closing."
        halt
    ]    
]
;=============================
; command_runner
;=============================
command_runner: function [command] [
    ;-----------------------
    either not-equal? find commands command none [
        print ["-- Start --"]
        print ["Running" command]
        do to-word command 
        print ["--Success--"]
    ][
        print "Error: Command does not exist"
    ]
    ;-----------------------
]
;=============================
; arg_parser
;   (in-progress)
;=============================
arg_parser: function [str] [
    print ["Parsing" str]
    ;-----------------------
    arg: split str " "
    ;-----------------------
    print ["Parsing: Success" arg]
    return arg
]
;=============================
; Test function
;=============================
hello_world: function [][
    print "******HELLO WORLD******"
]
;------------------------------
hx: function [][
    print "******HX******"
]
;=============================
; Forver
;=============================
forever [
    shell_renderer
]
;=============================
; Drafts**
;=============================
;---
;---- print print system/script/args
;---
