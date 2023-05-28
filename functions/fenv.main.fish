# The MIT License (MIT)

# Copyright (c) 2015 Derek Willian Stavis

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


function fenv.main
  bash -c "$argv && env -0 >&31" 31>| while read -l -z env_var
    set -l kv (string split -m 1 = $env_var); or continue
    # Skip read-only variables
    contains $kv[1] _ SHLVL PWD; and continue
    string match -rq '^BASH_.*%%$' $kv[1]; and continue
    # Variable
    # - is not defined
    # - OR variable differs
    # - OR variable is not exported
    if not set -q $kv[1]; or test "$$kv[1]" != $kv[2]; or not set -qx $kv[1]
      set -gx $kv
    end
  end
  return $pipestatus[1]
end
