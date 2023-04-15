#!/usr/bin/bash

set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir
  script_dir=$(dirname "${0}")

  local dotdir
  dotdir=$(dirname ${script_dir})

  if [[ "${HOME}" != "${dotdir}" ]]; then
    for file in "${dotdir}"/.??*; do
      local basename
      basename=$(basename "${file}")
      if [[ "${basename}" == ".git" ]]; then
        continue
      fi

      if [[ -L "${HOME}/${basename}" ]]; then
        command rm -f "${HOME}/${basename}"
        command echo "deleted $HOME/${basename}"
      fi
      if [[ -e "$HOME/${basename}" ]];then
        command mv "$HOME/${basename}" "$HOME/.dotbackup"
        command echo "move $HOME/${basename} to $HOME/.dotbackup"
      fi
      command ln -snf ${file} $HOME
      command echo "linked $HOME/${basename} to ${file}"
    done
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
command echo -e "\e[1;36m Install completed!!!! \e[m"
