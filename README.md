# dotvim.old
An archive of my retired pre-Lua Vim config.

Tested on **Christmas day 2024** and deemed functional at that particular time.

## Install
```bash
git clone git@github.com:davelens/dotvim.old.git ~/.dotvim.old
cd ~/.dotvim.old && ./install.sh && cd -
```
Plugins should bootstrap themselves automatically, though you might get an error related to solarized when you start vim for the first time. If you do, you need to run `:PlugInstall` to grab the missing plugins.

At any rate, you should close and restart vim to load in solarized correctly.

## Uninstall
```bash
cd ~/.dotvim.old && ./uninstall.sh && cd - && rm -rf ~/.dotvim.old
```
