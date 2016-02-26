####################
# Helper Functions #
####################

function source_if_present() {
  [[ -f "$1" ]] && source $1
}

function path_contains() {
  [[ ":$PATH:" == *":$1:"* ]]
}

function directory_exists() {
  [[ -d "$1" ]]
}

function command_exists() {
  type -t $1 >/dev/null
}

function append_path() {
  path_contains $1 || export PATH="${PATH:+"$PATH:"}$1"
}

function prepend_path() {
  path_contains $1 || export PATH="$1${PATH:+":$PATH"}"
}

function append_path_if_present() {
  directory_exists $1 && append_path "$1"
}

function prepend_path_if_present() {
  directory_exists $1 && prepend_path "$1"
}

function remove_from_path() {
  local readonly remove=$1
  local work=:$PATH:
  work=${work/:$remove:/:}
  work=${work#:}
  work=${work%:}
  export PATH=$work
}

#########################
# Custom PATH locations #
#########################

append_path_if_present $HOME/bin
append_path_if_present /usr/local/sbin

################
# And the rest #
################

source_if_present ~/.aliases
source_if_present ~/.bashrc.local
