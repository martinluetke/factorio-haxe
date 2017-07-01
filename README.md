# factorio-haxe
Factorio Modding with Haxe

Heavily WIP at the moment...

## Requirements

- Haxe latest development build,
  from http://hxbuilds.s3-website-us-east-1.amazonaws.com/builds/haxe/windows/
- nodemon (optional), for watchmode, via Node.js' npm 

## Recommended

- Visual Studio Code, with lua and haxe extensions, from https://code.visualstudio.com/

## Build

Make sure haxe is in path. Then run `haxe build.hxml` or `build.bat` from the command line or from within VS Code. This will create `control.lua`, Factorio's main mod file. Run `watch.bat` for continous watch and build mode.
