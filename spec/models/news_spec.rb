require 'rails_helper'

RSpec.describe News, type: :model do
  let :news do
    build(:news)
  end

  describe do
    subject do
      news
    end

    it 'バリデーションが通ること' do
      expect(subject).to be_valid
    end
  end
end
