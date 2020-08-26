# frozen_string_literal: true

RSpec.describe TalkApi::Client do # rubocop:disable Metrics/BlockLength
  describe '.new' do
    it 'was success' do
      expect(described_class.new).to be_instance_of(described_class)
    end
  end

  describe '.smalltalk' do
    let(:client) { described_class.new(api_key: api_key) }
    subject(:response) { client.smalltalk('test') }

    context 'when valid api_key' do
      let(:api_key) { 'valid_key' }
      it 'was success', vcr: { cassette_name: 'valid_api_key' } do
        expect(response.success?).to be_truthy
      end
    end

    context 'when invalid api_key' do
      let(:api_key) { 'invalid_key' }
      it 'was false', vcr: { cassette_name: 'invalid_api_key' } do
        expect(response.success?).to be_falsey
      end
    end

    context 'when HTTPCient exception' do
      let(:api_key) { 'valid_key' }
      it 'was raise TalkApi::HTTPError exception' do
        allow_any_instance_of(HTTPClient).to receive(:post).and_raise(StandardError, 'dummy error')
        expect { response }.to raise_error(TalkApi::HTTPError, 'dummy error')
      end
    end
  end
end
