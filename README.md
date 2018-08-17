# Go Git scripts installer

This is a simple script I wrote to install my other simple scripts. Hope you'll find some of them usefull

### BDSM  (Bash Database SQL Manager)

Smart script to do various things with your database.
Script description: https://github.com/michaelradionov/bdsm

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer bdsm
```

### Git Aliases

Usefull Git aliases.
Script description: https://github.com/michaelradionov/git-alias

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer gg_aliases
```



# Features

- It backups your old `.bashrc` to something like `.bashrc.backup_2018-08-17`

## Requirements

- Bash support. Check by executing `bash --version`
- cURL CLI support. Check by executing `curl --version`
- Sourcing ~/.bashrc file on session start. Check by:
    1. executing `echo 'echo "It works"' >> ~/.bashrc`
    2. then start new terminal session. If you see "It works!" then you good.
    3. Then **delete** this line from your ~/.bashrc.
- For the previous item. If you don't know where is ~/.bashrc, you should execute `cd` (without parameters), then `pwd`. Output will be your home path, it equals `~`.
- If you have literally ANY trouble with installing and using script, please, create an issue in Github repo https://github.com/michaelradionov/gg_installer.
