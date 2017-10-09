require 'json'
require 'typhoeus'

module Cloth
  class Client
    attr_reader :api_key
    def initialize(api_key = nil)
      @api_key = api_key || Cloth.api_key
      raise Exception, "An API key must be set before the Cloth client can be used. Set an API key with 'Cloth.api_key = ...'" unless @api_key
    end

    def get(url, options = {})
      JSON.parse(request(:get, url, options).run.body)
    end

    def post(url, options = {})
      headers = { 'Content-Type': "application/x-www-form-urlencoded" }
      JSON.parse(request(:post, url, options.merge({ headers: headers })).run.body)
    end

    def request(method, url, options = {})
      fixed_url = url[0] == "/" ? url[1..-1] : url
      Typhoeus::Request.new(
        [Cloth.api_url, fixed_url].join('/'),
        method: method,
        body: options[:body],
        params: options[:params],
        headers: {
          'Accept': 'application/json',
          'Cloth-Api-Key': @api_key,
          'Content-Type': 'application/json'
        }.merge(options[:headers] || {})
      )
    end

    class << self
      def get(url, options = {})
        Cloth.client.get(url, options)
      end

      def post(url, options = {})
        Cloth.client.post(url, options)
      end
    end
  end
end
