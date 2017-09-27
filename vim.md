## MacVim config


getting YouCompleteMe to work with MacVim
```
brew unlink python
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
brew link python
```
