if [ -d $HOME/.bun ]; then
  export BUN_INSTALL="$HOME/.bun"

  # bun completions
  [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

  # bun
  export PATH="$BUN_INSTALL/bin:$PATH"
fi
