require File.expand_path('../../../config/environment', __FILE__)

module Servers
  class Teltonika
    def initialize
      server
    end

    def server
      Socket.udp_server_loop(9261) {|msg, msg_src|
        p msg
        byebug
        service = DataDecompose.new
        #service.call(msg[0..-2])
        service.decompose_data(msg[0..-2])
#        msg_src.reply msg
      }

    end
  end
end