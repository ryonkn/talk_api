# frozen_string_literal: true

module TalkApi
  # Entry point class
  class Client
    def initialize(api_key: nil)
      @api_key = api_key
    end

    def smalltalk(message)
      Request.new.call(@api_key, message)
    end
  end
end
