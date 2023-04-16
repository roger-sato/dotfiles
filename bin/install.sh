#!/usr/bin/bash

set -ue

helpmsg() {
  echo "Usage: $0 [--help | -h]" 0>&2
  echo ""
}

link_to_homedir() {
  echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ]; then
    echo "$HOME/.dotbackup not found. Auto Make it"
    mkdir "$HOME/.dotbackup"
  fi

  local script_dir
  script_dir=$(dirname "$(readlink -f "$0")")

  local dotdir
  dotdir=$(dirname "${script_dir}")

  if [[ "${HOME}" != "${dotdir}" ]]; then
    for file in "${dotdir}"/.??*; do
      local basename
      basename=$(basename "${file}")
      if [[ "${basename}" == ".git" ]]; then
        continue
      fi

      if [[ -L "${HOME}/${basename}" ]]; then
        rm -f "${HOME}/${basename}"
        echo "deleted $HOME/${basename}"
      fi

      if [[ -e "$HOME/${basename}" ]]; then
        mv "$HOME/${basename}" "$HOME/.dotbackup"
        echo "move $HOME/${basename} to $HOME/.dotbackup"
      fi

      ln -snf "${file}" "${HOME}"
      echo "linked $HOME/${basename} to ${file}"
    done
  else
    echo "same install src dest"
  fi
}

while [ $# -gt 0 ]; do
  case "${1}" in
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
echo -e "\e[1;36m Install completed!!!! \e[m"

