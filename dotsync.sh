#!/bin/sh

dotsyncrc="$HOME/.dotsyncrc"
home="$HOME"
dir="dotfiles"


if [ -f ./test ]; then
  source "${dotsyncrc}"
fi


function printVersion() {
  echo "1.0.0"
}


function printUsage() {
  echo "Usage: dotsync [OPTIONS] [SUBCOMMAND]"
  echo "OPTIONS:"
  echo "  -v, --version   Print version info and exit."
  echo "  -h, --help      Print usage and exit."
  echo "SUBCOMMANDS:"
  echo "  link            Create link and exit."
  echo "  delink          Delete link and exit."
  echo "  dir             Setup dotfiles origin folder and exit."
}


if [ "$1" == "--version" ] || [ "$1" == "-v" ]; then
  printVersion
  exit 0
fi


if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  printUsage
  exit 0
fi


if [ "$1" == "dir" ]; then
  if [ -z "$2" ]; then
    echo ${home}"/"${dir}
  else
    dir="$2"
    echo "dir=${2}" >> "${dotsyncrc}"
  fi
  exit 0
fi


if [ "$1" == "link" ]; then
  if [ -d ${home}"/"${dir} ]; then
    files=${home}"/"${dir}"/*"
    for filepath in $files; do
      if [ -f $filepath ]; then
        file=$(basename ${filepath})
        head="$file:0:1"
        if [ head != "." ]; then
          command="ln -s "${filepath}" ~/."${file}
          echo ${command}
        fi
      fi
    done
  fi
  exit 0
fi

if [ "$1" == "delink" ]; then
  if [ -d ${home}"/"${dir} ]; then
    files=${home}"/"${dir}"/*"
    for filepath in $files; do
      if [ -f $filepath ]; then
        file=$(basename ${filepath})
        head="$file:0:1"
        if [ head != "." ]; then
          command="rm ~/."${file}
          echo ${command}
        fi
      fi
    done
  fi
  exit 0
fi


if [ "$1" == "test" ]; then
  echo "test"
  exit 0
fi
