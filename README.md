# Fish Foreign Environment

This plugin wraps application execution so that environment variables exported
or modified by them get imported into fish. This makes possible running popular
bash scripts, like the excellent `nvm`.

# Usage examples

You can use bash syntax to export variables.

    fenv export PYTHON=python2

This will have the same effect as typing

    set -g -x PYTHON python2

You can also call multiple commands, separated by semicolon

    fenv source ~/.nvm/nvm.sh \; nvm --help

You need to escape semicolon with slash `\;` or by double quoting `';'` to
prevent fish from interpreting it.

## Installation

Add the following line to your __Oh My Fish!__ config file:

    Plugin "foreign-env"

Reload your shell, issue a `omf install` and reload again.

## Caveats

* Some applications may loose output formatting due to the way fish handle storage
of multiline strings.
* Currently we only handle environment variables that are added or modified. If
a variable is unset (removed from environment) it will not be removed from fish.

## License

```
The MIT License (MIT)

Copyright (c) 2015 Derek Willian Stavis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
