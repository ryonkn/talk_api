# frozen_string_literal: true

require 'httpclient'
require 'json'

module TalkApi
  # API request class
  class Request
    ENDPOINT_URL = 'https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk'
    HEADERS = { 'User-Agent' => "#{self}/#{VERSION}" }.freeze

    def call(api_key, message)
      query = message.byteslice(0, 2048).scrub('')
      begin
        client = HTTPClient.new(default_header: HEADERS)
        response = client.post(ENDPOINT_URL, { apikey: api_key, query: query })
      rescue StandardError => e
        raise HTTPError, e.message
      end
      json = JSON.parse(response.body, symbolize_names: true)
      Response.new(json[:status], json[:message], json[:results])
    end
  end
end
