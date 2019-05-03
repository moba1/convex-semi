#!/usr/bin/env bash

COMMAND_NAME=${0##*/}

function version() {
  echo -e "\033[1m$COMMAND_NAME\033[0m" v0.1
}

function usage() {
  echo -e "\033[32;1m${COMMAND_NAME}\033[0m: テンプレートから各資料用のディレクトリを作成"
  echo -e "\033[33;1m使い方:\033[0m"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m n"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m [-h | -v | -l]"
  echo -e "\033[34;1mオプション\033[0m"
  echo -e "  \033[1m-h\033[0m  ヘルプを表示"
  echo -e "  \033[1m-v\033[0m  バージョンを表示"
  echo -e "  \033[1m-l\033[0m  latexmkrcをコピーする"
  echo -e "\033[34;1m引数:\033[0m"
  echo -e "  \033[1mn\033[0m  第n回のn(n: 整数)"
}

function main() {
  local use_latexmk=0

  # オプション解析
  while getopts hvl OPT; do
    case $OPT in
      h) usage; exit;;
      v) version; exit;;
      l) use_latexmk=1;;
      \?) usage; exit 1;;
    esac
  done
  shift $((OPTIND - 1))

  # 引数は1つ必要
  if [ $# -eq 0 ]; then
    echo -e "\033[31;1mError: one argument required\033[0m"
    usage; exit 1
  fi

  # 第1引数に数値がきてるかチェック
  if ! python -c "int('$1')" 2>/dev/null; then
    echo -e "\033[31;1mError: argument should be number\033[0m" >&2
    usage; exit 1
  fi

  local root=$(dirname $0)/../
  local template=$root/template src=$root/src/$1
  cp -r $template/base $src
  if [ $use_latexmk -eq 1 ]; then
    cp $template/latexmkrc $src/.latexmkrc
  fi
}

main $@
