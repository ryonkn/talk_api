# frozen_string_literal: true

require 'json'

module TalkApi
  # Response class
  class Response
    attr_reader :status, :message, :results

    def initialize(data = '{}')
      json = JSON.parse(data, symbolize_names: true)

      @status = json.key?(:status) ? json[:status] : nil
      @message = json.key?(:message) ? json[:message] : nil
      @results = json[:results].map { |result| Result.new(result[:perplexity], result[:reply]) } if success?
    end

    def success?
      @status.zero?
    end

    def first_message
      return nil unless success?

      @results.first.reply
    end
  end
end
