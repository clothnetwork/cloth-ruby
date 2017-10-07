require "cloth/client"
require "cloth/item"
require "cloth/user"
require "cloth/version"

module Cloth
  class << self
    attr_accessor :api_key, :client

    def client
      @_client ||= Cloth::Client.new
    end

    def api_url
      @api_url ||= "https://api.cloth.network"
    end

    def api_url=(url)
      @api_url = url
    end
  end
end
