require 'socket'               # Get sockets from stdlib
require 'json'

CODE_MESSAGES = {
  200 => "OK",
  404 => "Not Found"
}

CONTENT_TYPE = {
  "html" => "text/html",
  "txt" => "text/plain",
  "png" => "image/png",
  "jpg" => "image/jpg",
  "gif" => "image/gif"
}

def mount_header(code,content_type,response)
  header = "HTTP/1.1 #{code}\r\n"
  if (code.eql?200)
    header << "Content-Type: #{content_type}\r\n"+
    "Content-Length: #{response.length}\r\n" +
    "Connection: close\r\n\r\n"
  end
end

server = TCPServer.open(2000)

loop {
  socket  = server.accept
  request = socket.recv(1000).split("\r\n\r\n")
  header = request.first.split("\n")
  body = request.last

  method = header[0].split[0]
  path = header[0].split[1]

  response = ""

  if File.exist?(path)
    extension_of_file = path.split(".")[-1]
    if method.eql?"GET"
      File.open(path).each { |line| response << line + "\n"}
      socket.print(mount_header(200,CONTENT_TYPE[extension_of_file],response))
    elsif method.eql?"POST"
      params = JSON.parse(body)
      data = "<li>name: #{params['viking']['name']}</li><li>e-mail: #{params['viking']['email']}</li>"
      response = File.read(path).gsub("<%= yield %>", data)
      socket.print(mount_header(200,CONTENT_TYPE[extension_of_file],response))
    end
  else
    socket.print(mount_header(404,"",response))
    # socket.print "HTTP/1.1 404 Not Found\r\n"
    socket.print "\r\n"
  end
  socket.print(response)
  socket.close
}
