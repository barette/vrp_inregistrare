 --[[
 eskape e cel mai smecher pe sistemu' asta. r3sp3kt.
 Krimes Never Die Madafakars. www.krimes.ro 
--]]
description "vrp_business"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
