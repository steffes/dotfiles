brew install python3

pip install --user powerline-status
brew install macvim --env-std --with-override-system-vim

brew install ffmpeg 
brew install ansiweather
brew install exiftool
brew install ffmpeg
brew install go
brew install gobject-introspection
brew install gphoto2 # for controling dslr camera
brew install httpie
brew install mackup
brew install macvim
brew install mongodb
brew install neovim-dot-app
brew install node
brew install openssl
brew install pianobar
brew install popt
brew install postgresql
brew install readline
brew install rename
brew install rtmpdump
brew install ssh-copy-id
brew install tmux
brew install wget
brew install wifi-password
brew install youtube-dl

 # Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep --with-default-names
brew install homebrew/dupes/openssh

# You'll need to run through fzf's setup
# Note: I've already added required configuration to ~/.extras
# brew install fzf
# /usr/local/opt/fzf/install

# Misc useful formulae (brew list -la | awk '{a="brew install "$9; print a}' | pbcopy)
brew install ack
brew install findutils
brew install fpp
brew install gifsicle
brew install highlight
brew install htop-osx
brew install imagemagick --with-webp
brew install lynx
brew install mongodb
brew install nmap
brew install nvm
brew install ruby
brew install sqlite
brew install the_silver_searcher
brew install tmux
brew install tofrodos
brew install tree
brew install z

brew cleanup