require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { build(:document) }
  describe '書類のバリデーションについて' do
    it 'バリデーションが通ること' do
      document.save!
      expect(subject).to be_valid
    end
  end
end
