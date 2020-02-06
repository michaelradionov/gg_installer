# Go Git scripts installer

This is a simple script I wrote to install my other simple scripts. Hope you'll find some of them usefull

### 💋 BDSM  (Bash Database SQL Manager)

Smart script to do various things with your database.
Script description: https://github.com/michaelradionov/bdsm

Stable version

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer bdsm
```

Nightly version


```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer bdsm_nightly
```



### 🎭 Git Aliases

Usefull Git aliases.
Script description: https://github.com/michaelradionov/git-alias

For Git v2+

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer gg_aliases
```

For Git v1.X

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer gg_aliases_1X
```

### 👋 Hello Bash

Bash prompt generator with Git support

Script description: https://github.com/michaelradionov/helloBash

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer hello_bash
```

### DFH

`df -h` with Cron and Slack

Script description: https://github.com/michaelradionov/dfh


```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer dfh
```


### Brancher

Our branch switcher little script

Script description: https://github.com/Flagstudio/brancher

```shell
eval "$(curl "https://raw.githubusercontent.com/michaelradionov/gg_installer/master/gg_installer.sh")" && gg_installer brancher
```


# Features

- It works on Windows, Mac and Linux in Bash supporting terminals
- It backups your old `.bashrc` to something like `.bashrc.backup_2018-08-17`
- It writing single line of code in your `~/.bashrc` for all GG scripts
- This line is first checking foк scripts existence and only then sourcing them. So it will never break anything

## Requirements

- Bash support. Check by executing `bash --version`
- cURL CLI support. Check by executing `curl --version`
- Sourcing ~/.bashrc file on session start. Check by:
    1. executing `echo 'echo "It works"' >> ~/.bashrc`
    2. then start new terminal session. If you see "It works!" then you good.
    3. Then **delete** this line from your ~/.bashrc.
- For the previous item. If you don't know where is ~/.bashrc, you should execute `cd` (without parameters), then `pwd`. Output will be your home path, it equals `~`.
- If you have literally ANY trouble with installing and using script, please, create an issue in Github repo https://github.com/michaelradionov/gg_installer.
