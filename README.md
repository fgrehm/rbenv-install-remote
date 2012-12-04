# rbenv-install-remote

rbenv-install-remote is a [ruby-build](https://github.com/sstephenson/ruby-build)
and [rbenv](https://github.com/sstephenson/rbenv) plugin that hooks into
`rbenv install` command to download and install remote build definitions.

## Installation

First make sure you have an updated `ruby-build`, as you'll need the
[support for hooks](https://github.com/sstephenson/ruby-build/commit/cb2a79f1119daf6cbb030d76f66e9bd04581ccc2)
in place.

    $ cd ~/.rbenv/plugins/ruby-build
    $ git pull

Installing rbenv-install-remote as an rbenv plugin will allow you to use
`rbenv install` with remote build definitions.

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

You can also specify a version name if the url isn't enough:

    $ VERSION_NAME=my-ruby-version rbenv install https://raw.github.com/gist/some-crazy-url.sh

If you wanna know more about custom definitions, see the [ruby-build built-in
definitions](https://github.com/sstephenson/ruby-build/tree/master/share/ruby-build)
as a starting point for definition files.

### Known definitions

These 2 definitions will allow you to install REE on Ubuntu 12.04 with the patch
that will enable tcmalloc support so that you won't have to use
`CONFIGURE_OPTS="--no-tcmalloc"` when running `rbenv install`.

```terminal
$ rbenv install https://raw.github.com/gist/3345650/ree-1.8.7-2011.03
$ rbenv install https://raw.github.com/gist/3345650/ree-1.8.7-2012.02
```

This one is a patched `1.9.3-p194` for 30% faster Rails boot. See
https://gist.github.com/1688857 for more information.

```terminal
$ VERSION_NAME=1.9.3-p194-patched rbenv install https://raw.github.com/gist/1688857/2-1.9.3-p194-patched.sh
```

There is also an [updated version](https://gist.github.com/2593385) of the patch
that applies to `1.9.3-p286` as well.

```terminal
$ rbenv install https://raw.github.com/gist/7f4e8a98c16e9f67ecba/1.9.3-p194-falcon
$ rbenv install https://raw.github.com/gist/7f4e8a98c16e9f67ecba/1.9.3-p286-falcon
```

For `1.9.3-p327`:

```terminal
$ VERSION_NAME=1.9.3-p327-patched rbenv install https://raw.github.com/gist/1688857/2-1.9.3-p327-patched.sh
```

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
