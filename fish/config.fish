if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx LC_ALL en_US.UTF-8
set -g fish_greeting

abbr -a -g  ga git add
abbr -a -g  gaa git add --all
abbr -a -g  gb git branch
abbr -a -g  gbd git branch -D
abbr -a -g  gcam git commit -a -m
abbr -a -g  gcn! git commit -v --no-edit --amend
abbr -a -g  gco git checkout
abbr -a -g  gss git status -s

source /opt/homebrew/opt/asdf/libexec/asdf.fish
