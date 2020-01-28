FROM            lua:5.3
RUN             apk update && apk add --no-cache gcc libc-dev # for luafilesystem
RUN             luarocks install luafilesystem
COPY            . /app/
