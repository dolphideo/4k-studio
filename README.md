# Dolphideo Website

A website of [Dolphideo](http://dolphideo.pl) company website.

## Technology stack

Constructed using [Middleman](http://middlemanapp.com) and enjoying free hosting from [Github Pages](http://pages.github.com).

## Installation

All you have to do is to download this repository and install required gems:
```shell
git clone https://github.com/Dolphideo/dolphideo.github.io.git -b development
cd dolphideo.github.io
bundle install
```

After this you are ready to go! Just Edit any files necessary in

```
/source/
```

Before you commit your changes, make sure you are on development branch.

After commiting your changes - publish them using
```shell
middleman deploy
```

If you want to persist the changes you made, remember to merge development branch with remote

```shell
git push origin development:development
```

That's it! Watch for changes online!

[dolphideo.github.io](http://dolphideo.github.io)