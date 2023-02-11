# Dockerfile for luvit server
FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
RUN mv /lit /luvi /luvit /usr/local/bin
RUN mkdir /opt/luvit
RUN echo "#!/usr/local/bin/luvit\n\
local http = require('http')\n\
\n\
http.createServer(function (req, res)\n\
  local body = [[Hello world\n]]\n\
  res:setHeader('Content-Type', 'text/plain')\n\
  res:setHeader('Content-Length', #body)\n\
  res:finish(body)\n\
end):listen(1337, '0.0.0.0')\n\
\n\
print('Server running at http://0.0.0.0:1337/')\n\
" > /opt/luvit/server.lua
RUN chmod 755 /opt/luvit/server.lua
CMD ["/opt/luvit/server.lua"]

