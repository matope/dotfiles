# Completion
setopt correct           # コマンドのスペルミスを指摘
setopt list_packed       # 補完候補をコンパクトに表示
setopt noautoremoveslash # パス保管候補の末尾のスラッシュを省略しない
setopt nolistbeep        # 補完候補の表示時にbeepを鳴らさない

fpath=(~/.zsh/completion $fpath)

# Enable completion system.
autoload -U compinit && compinit
setopt complete_aliases # 補完前にエイリアスを展開
