<img src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png" align="left" width="144px" height="144px"/>

#### Foreign Environment
> A foreign environment interface for Fish shell

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)
[![test](https://github.com/oh-my-fish/plugin-foreign-env/actions/workflows/test.yml/badge.svg)](https://github.com/oh-my-fish/plugin-foreign-env/actions/workflows/test.yml)

<br/>

Foreign environment wraps application execution in a way that environment variables that are exported or modified get imported back into fish. This makes possible running popular bash scripts, like the excellent `nvm`.


# Install

Be sure to have [Oh My Fish][omf-link] installed, so you just need to:

```fish
omf install foreign-env
```

If you dislike shell frameworks, you can still use Foreign Environment in Fish! Clone this repo somewhere and append to your `~/.config/fish/config.fish`:

```fish
set fish_function_path $fish_function_path <insert path to foreign-env repo>/functions
```


# Usage examples

You can use bash syntax to export variables:

```fish
fenv export PYTHON=python2
```

This will have the same effect as typing:

```fish
set -g -x PYTHON python2
```

You can also call multiple commands, separated by semicolon:

```fish
fenv source ~/.nvm/nvm.sh \; nvm --help
```

When commands aren't double quoted, you need to escape semicolon with slash `\;` to prevent fish from interpreting it. Or just quote the whole command:

```fish
fenv "source ~/.nvm/nvm.sh; nvm --help"
```

You can also choose to print the output instead of setting the environment:

```fish
fenv -p export PYTHON=python2
```

will print

```fish
set -g -x PYTHON python2
```

instead of executing the command. This can be used to translate a foreign environment file to a native fish file.


# Caveats

* Currently we only handle environment variables that are added or modified. If a variable is unset (removed from environment) it will not be removed from fish.

# License

[MIT][mit] © [Derek Willian Stavis][author]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/derekstavis
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
