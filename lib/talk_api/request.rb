# frozen_string_literal: true

require 'httpclient'

module TalkApi
  # API request class
  class Request
    ENDPOINT_URL = 'https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk'.freeze
    USER_AGENT = "#{self} #{VERSION}".freeze
    HEADERS = [
      ['User-Agent', USER_AGENT]
    ].freeze

    def call(api_key, message)
      query = message.byteslice(0, 2048).scrub('')
      client = HTTPClient.new
      response = client.post(ENDPOINT_URL, { apikey: api_key, query: query }, header: HEADERS)
      Response.new(response.body)
    end
  end
end
