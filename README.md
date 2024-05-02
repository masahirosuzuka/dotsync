# Dotsyncについて

- Dotsyncはドットファイル(.zshrc, .bashrc, .vimrc ...etc)を同期するためのツールです

# 使い方（同期元）

1. GithubやGitLabなどでドットファイル管理用のレポジトリ（以下、dotfilesレポジトリ）を作成してください
1. dotfiles管理用ディレクトリを作成してください。
1. ホームディレクトリにあるドットファイルをdotfiles管理用ディレクトリに移動してください。
　例)mv ~/.zshrc ~/dotfiles/zshrc
1. dotfilesディレクトリに移動したドットファイルはファイル名先頭の.を取り除いてください
1. dotfilesディレクトリをdotfilesレポジトリで管理してください

# 使い方（同期先）

1. ホームディレクトリにdotfilesレポジトリをcloneしてください
1. dotsync linkを実行するとドットファイル管理用ディレクトリにあるファイルにシンボリックリンクが張られます。例) ln -s ~/dotfiles/zshrc ~/.zshrc
1. dotfile dirを実行するとドットファイル管理用ディレクトリのパスを設定できます
1. dotsync delinkを実行するとホームディレクトリのシンボリックリンクが削除されます
