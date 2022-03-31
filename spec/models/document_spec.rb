require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:business) { create(:business) }
  let(:request_order) { create(:request_order) }
  let(:document) { build(:document) }

  describe 'バリデーションについて' do
    subject { document }

    it 'バリデーションが通ること' do
      expect(subject).to be_valid
    end
  end
end
