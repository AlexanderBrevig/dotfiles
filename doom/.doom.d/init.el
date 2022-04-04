;;; init.el -*- lexical-binding: t; -*-

(setenv "SHELL" "/usr/bin/bash")
(setq explicit-shell-file-name "/usr/bin/bash")

(doom! :input
       :completion
       company           ; the ultimate code completion backend
       vertico           ; the search engine of the future

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       (ligatures +extra)         ; ligatures and symbols to make your code pretty again
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink cursor line after big motions
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       snippets          ; my elves. They type so I don't have to

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere
       vterm             ; the best terminal emulation in Emacs

       :checkers
       (syntax +childframe)              ; tasing you for every semicolon you forget
       (spell +flyspell) ; tasing you for misspelling mispelling

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       (magit +forge)             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       tty               ; improve the terminal Emacs experience

       :lang
       (cc +lsp)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       (emacs-lisp +lsp)        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       (go +lsp)         ; the hipster dialect
       ;;(haskell +lsp)    ; a language that's lazier than I am
       json              ; At least it ain't XML
       (java +lsp)       ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       kotlin            ; a better, slicker Java(Script)
       latex             ; writing papers in Emacs has never been so fun
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;ocaml             ; an objective camel
       (org +pretty +journal +roam2 +present)
       ;;plantuml          ; diagrams for confusing people more
       (python +lsp)            ; beautiful is better than ugly
       ;;racket            ; a DSL for DSLs
       rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       (sh +lsp)                ; she sells {ba,z,fi}sh shells on the C xor
       ;;web               ; the tubes
       (yaml +lsp)              ; JSON, but readable

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       regex
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       (default +bindings +smartparens)
       literate)
