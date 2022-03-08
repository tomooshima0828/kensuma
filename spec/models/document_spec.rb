require 'rails_helper'

RSpec.describe Document, type: :model do
  let :document do
    build(:document)
  end

  describe '書類のバリデーションについて' do
    subject do
      document
    end

    it 'バリデーションが通ること' do
      expect(subject).to be_valid
    end
  end
end
