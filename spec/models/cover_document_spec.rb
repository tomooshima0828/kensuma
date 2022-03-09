require 'rails_helper'

RSpec.describe CoverDocument, type: :model do
  let(:document) { build(:document) }
  let(:cover_document) { build(:cover_document, document: document) }
  describe 'documentとcover_documentをそれぞれ生成' do
    it 'cover_documentが存在すること' do
      document.save!
      cover_document.save!
      expect(document).to be_valid
      expect(cover_document).to be_valid
    end
  end
end
