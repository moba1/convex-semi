#!/usr/bin/env bash

COMMAND_NAME=${0##*/}
SRC_ROOT=$(cd $(dirname $0)/../src && pwd)

function version() {
  echo -e "\033[1m${COMMAND_NAME}\033[0m v0.1"
}

function usage() {
  echo -e "\033[32;1m${COMMAND_NAME}\033[0m: 各資料のビルドやクリーンをする"
  echo -e "\033[33;1m使い方:\033[0m"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m usage"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m version"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m build"
  echo -e "  \033[1m${COMMAND_NAME}\033[0m clean"
  echo -e "\033[34;1mサブコマンド\033[0m"
  echo -e "  \033[1musage\033[0m            使い方を表示"
  echo -e "  \033[1mversion\033[0m          バージョンを表示"
  echo -e "  \033[1mbuild\033[0m [n]  資料をビルドする(数を指定すればその指定回数の資料だけビルド)"
  echo -e "  \033[1mclean\033[0m [n]   クリーンアップ処理(数を指定すれば, 指定回数の資料にたいしてだけクリーンアップ処理)"
}

function build() {
  if [ $# -eq 0 ]; then
    # 引数が指定されなければ全てビルド
    for target in $(echo $SRC_ROOT/[0-9]*); do
      bash -c "cd $target && make"
    done
  else
    # 引数は整数でなければならない
    if ! python -c "int('$1')" 2>/dev/null; then
      echo -e "\033[31;1mError: argument should be number\033[0m" >&2
      exit 1
    fi
    # 引数が指定されれば、指定された数だけビルド
    bash -c "cd $SRC_ROOT/$1 && make"
  fi

  # できたPDFはdocディレクトリへ移動
  for dir in $(ls $SRC_ROOT); do
    mv $SRC_ROOT/$dir/main.pdf $SRC_ROOT/../doc/$(basename $dir).pdf
  done
}

function clean() {
  if [ $# -eq 0 ]; then
    # 引数が指定されなければ全てクリーンに
    for i in $SRC_ROOT/[0-9]*; do
      bash -c "cd $i && echo -e '\033[32;1m-> $i\033[0m' && make clean"
    done
  else
    # 引数は整数でなければならない
    if ! python -c "int('$1')" 2>/dev/null; then
      echo -e "\033[31;1mError: argument should be number\033[0m" >&2
      exit 1
    fi

    # 引数が指定されたものだけクリーンに
    bash -c "cd $SRC_ROOT/$1 && echo -e '\033[32;1m-> $SRC_ROOT/$1\033[0m' && make clean"
  fi
}

function main() {
  # オプション解析
  while getopts hv OPT; do
    case $OPT in
      h) echo test; usage; exit;;
      v) version; exit;;
      \?) usage; exit 1;;
    esac
    echo $OPT
  done
  shift $((OPTIND - 1))

  # サブコマンドが指定されていなければエラー
  if [ $# -eq 0 ]; then
    echo -e "\033[31;1mError: subcommand required\033[0m" >&2
    usage; exit 1
  fi
  $*
}

main $@
