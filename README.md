# xoru/lua

[xoru/lua](https://github.com/Imagine-Programming/docker-xoru-lua) is a tiny and simple Docker image for Lua and LuaRocks. Currently, the tags 5.1, 5.2, 5.3 and latest indicate which Lua version and LuaRocks install are being used. latest indicates the use of the latest Lua version, future Lua versions will be added. Once I get luarocks in alpine working for luajit, lua:jit will be added as tag as well.

Alpine (latest) is used as base image, tini is used as simple init.

## Getting Started

These instructions will cover usage information and for the docker image 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Using the Base image

You can mount your app directory to /app, which should contain a `main.lua` file. This usecase works fine if you do not require any packages from LuaRocks.

```shell
docker run -v /path/to/my/application:/app xoru/lua     # latest
docker run -v /path/to/my/application:/app xoru/lua:5.1 # Lua 5.1
docker run -v /path/to/my/application:/app xoru/lua:5.2 # Lua 5.2
docker run -v /path/to/my/application:/app xoru/lua:5.3 # Lua 5.3
```

#### Creating your own image

You can also quite easily build your own image, using this as base image. This is a way to install LuaRocks packages, but also dependencies for those packages through `apk add` - see [test/Dockerfile](test/Dockerfile) for an example.

```dockerfile
FROM            xoru/lua:5.3
RUN             apk update && apk add --no-cache gcc libc-dev # for luafilesystem
RUN             luarocks install luafilesystem
COPY            . /app/
```

```lua
local lfs = require "lfs";

for entry in lfs.dir("./") do
  if (not entry:match("^([%.]+)$")) then
    print("entry", entry);
  end
end
```

#### Volumes

* `/app` - The directory which contains `main.lua`, the application to run.

#### Useful File Locations

* `/usr/sbin/lua` - a link to the Lua binary for the selected version
* `/usr/sbin/luac` - a link to the Luac binary for the selected version
* `/usr/sbin/luarocks` - a link to the luarocks binary for the selected version

## Built With / Based On

* [alpine:latest](https://alpinelinux.org/)
* [tini](https://github.com/krallin/tini)

## Find Us

* [GitHub](https://github.com/Imagine-Programming/docker-xoru-lua)

## Versioning

Version numbers are in the image tags, the tag indicates the Lua build.

## Authors

* **Bas Groothedde** - *Dockerfile* - [xoru.net](https://www.xoru.net)

## License

You are free to do anything you want with this tiny project.

## Acknowledgments

* [Lua](https://lua.org)
* [LuaRocks](https://luarocks.org/)
