# rbenv-install-remote

rbenv-install-remote is a [ruby-build](https://github.com/sstephenson/ruby-build)
and [rbenv](https://github.com/sstephenson/rbenv) plugin that hooks into
`rbenv install` command to download and install remote build definitions.

## Installation

There's currently no official support for hooking into `rbenv-install`, [I've
sent a patch](https://github.com/sstephenson/ruby-build/pull/201) that will
allow for this plugin to work out of the box and meanwhile you'll have to use
the [hooks-support branch](https://github.com/fgrehm/ruby-build/tree/hooks-support)
from my fork of the project in order for this plugin to work.

    $ mkdir -p ~/.rbenv/plugins
    $ cd ~/.rbenv/plugins
    $ git clone git://github.com/fgrehm/ruby-build.git -b hooks-support

If you already have ruby-build installed as a rbenv plugin, you can just checkout
the hooks-support branch from my fork.

    $ cd ~/.rbenv/plugins/ruby-build
    $ git remote add fgrehm git://github.com/fgrehm/ruby-build.git
    $ git fetch fgrehm && git checkout fgrehm/hooks-support

Now that you have ruby-build with hooks enabled, installing rbenv-install-remote
as an rbenv plugin will allow you to use `rbenv install` with remote build
definitions.

    $ mkdir -p ~/.rbenv/plugins
    $ cd ~/.rbenv/plugins
    $ git clone git://github.com/fgrehm/rbenv-install-remote.git

## Usage

As this plugin will only hook into `ruby-build` and download the custom definition
before building, please refer to [ruby-build](https://github.com/sstephenson/ruby-build)
to find out its supported parameters. With `rbenv-install-remote` you'll be able
to:

    $ rbenv install https://raw.github.com/gist/my-ruby-version

And if everything goes fine, this will provide a `my-ruby-version` for use
with rbenv.

If you wanna know more about custom definitions, see the [ruby-build built-in
definitions](https://github.com/sstephenson/ruby-build/tree/master/share/ruby-build)
as a starting point for custom definition files.

### Known definitions

These 2 definitions will allow you to install REE on Ubuntu 12.04 with the patch
that will enable tcmalloc support so that you won't have to use
`CONFIGURE_OPTS="--no-tcmalloc"` when running `rbenv install`.

* https://raw.github.com/gist/3345650/ree-1.8.7-2011.03
* https://raw.github.com/gist/3345650/ree-1.8.7-2012.02

If you have a custom definition to share, please send me the link or a pull request
adding it to the list above ;)

### License

(The MIT License)

Copyright (c) 2012 Fábio Rehm

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
