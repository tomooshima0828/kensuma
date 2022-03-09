require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { build(:document) }
  describe '書類のバリデーション' do
    it '書類のバリデーションが通り保存されること' do
      document.save!
      expect(subject).to be_valid
    end
  end
end
