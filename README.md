# dotvim.old
An archive of my retired pre-Lua Vim config.

Tested on **Christmas day 2024** and deemed functional at that particular time.

## Install
```bash
git clone git@github.com:davelens/dotvim.old.git ~/.dotvim.old
cd ~/.dotvim.old && ./install.sh && cd -
```
You will get an error related to solarized when you start vim for the first 
time. You need to run `:PlugInstall` to grab the missing plugins and then restart vim to get rid of the error.

I never got around to bootstrapping them. So it goes.

## Uninstall
```bash
cd ~/.dotvim.old && ./uninstall.sh && cd - && rm -rf ~/.dotvim.old
```
