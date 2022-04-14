require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:user) { create(:user) }
  let(:business) { create(:business, user: user) }
  let(:order) { create(:order, business: business) }
  let(:request_order) { create(:request_order, business: business, order: order) }
  let(:document) { create(:document, business: business, request_order: request_order) }

  describe 'バリデーションについて' do
    subject { document }

    it 'バリデーションが通ること' do
      expect(subject).to be_valid
    end
  end
end
