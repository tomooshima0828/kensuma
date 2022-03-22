require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { build(:document) }

  describe 'documentの生成と保存' do
    it 'documentが保存されること' do
      document.save!
      expect(subject).to be_valid
    end
  end

  describe 'アソシエーションについて' do
    let :document do
      create(:document,
        cover_document: cover_document,
        table_of_contents_document: table_of_contents_document
      )
    end

    let(:cover_document) { build(:cover_document) }
    let(:table_of_contents_document) { build(:table_of_contents_document) }

    context '紐つく表紙がある場合' do
      subject { document.cover_document }

      it '紐つく表紙を返すこと' do
        expect(subject).to eq(cover_document)
      end
    end

    context '紐つく目次・チェック欄がある場合' do
      subject { document.table_of_contents_document }

      it '紐つく目次・チェック欄を返すこと' do
        expect(subject).to eq(table_of_contents_document)
      end
    end
  end
end
