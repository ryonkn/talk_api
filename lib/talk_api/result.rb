# frozen_string_literal: true

module TalkApi
  # Store result class
  class Result
    attr_reader :perplexity, :reply

    def initialize(perplexity, reply)
      @perplexity = perplexity
      @reply = reply
    end
  end
end
