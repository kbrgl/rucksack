Rack::Attack.throttle("requests by ip", limit: 50, period: 1.minute) do |request|
  request.ip
end
