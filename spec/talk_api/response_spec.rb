# frozen_string_literal: true

RSpec.describe TalkApi::Response do # rubocop:disable Metrics/BlockLength
  let(:response) { build(:response) }
  let(:fail_response) { build(:fail_response) }

  describe '.success?' do
    context 'when valid response' do
      it 'was true' do
        expect(response.success?).to be_truthy
      end
    end

    context 'when invalid response' do
      it 'was false' do
        expect(fail_response.success?).to be_falsy
      end
    end
  end

  describe '.first_message' do
    context 'when valid response' do
      it 'was return valid message' do
        expect(response.first_message).to be('test')
      end
    end

    context 'when invalid response' do
      it 'was return nil' do
        expect(fail_response.first_message).to be_nil
      end
    end
  end
end
