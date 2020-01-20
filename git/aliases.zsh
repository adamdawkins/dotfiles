# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias glog='git log --pretty=format:'\''%Cred%h%Creset %ad %s %C(yellow)%an%Creset'\'' --graph --date=relative'
alias gp='git push origin HEAD'
alias gpa='git push -u origin --all'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"
alias grh='git reset HEAD'
alias grso='git remote show origin'
alias feature='git flow feature'
alias release='git flow release'
alias hotfix='git flow hotfix'

function git-remote-merged () {
  for branch in `git branch -r --merged | grep -v HEAD`; do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r
}

function git-remote-not-merged () {
  for branch in `git branch -r --no-merged | grep -v HEAD`; do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r
}
alias bfg='java -jar ~/development/bfg-1.12.13.jar'

