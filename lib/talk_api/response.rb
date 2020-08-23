# frozen_string_literal: true

module TalkApi
  # Response class
  class Response
    attr_reader :status, :message, :results

    Result = Struct.new(:perplexity, :reply)

    def initialize(status, message, results = [])
      @status = status
      @message = message
      @results = results.map { |result| Result.new(result[:perplexity], result[:reply]) } if success?
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
