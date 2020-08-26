# frozen_string_literal: true

FactoryBot.define do
  factory :response, class: 'TalkApi::Response' do
    status { 0 }
    message { 'ok' }
    results { [{ perplexity: 1.5, reply: 'test' }] }

    initialize_with do
      TalkApi::Response.new(status, message, results)
    end
  end

  factory :fail_response, class: 'TalkApi::Response' do
    status { 1000 }
    message { 'apikey is null' }
    results { [] }

    initialize_with do
      TalkApi::Response.new(status, message, results)
    end
  end
end
