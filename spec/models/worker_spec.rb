require 'rails_helper'

RSpec.describe Worker, type: :model do
  # ユーザーと事業所はベタ書きしない
  let(:user) { create(:user) }
  let(:business) { create(:business) }
  let(:worker) { build(:worker, name: 'TestWorker', name_kana: 'テストワーカー', country: '東京都', ) }

  describe "バリデーションのテスト" do
    context "名前、名前カナ、国籍、住所、電話番号、家族住所、家族電話番号、生年月日、血液型、職種、雇入年月日、雇入前経験年数、ブランク年数がある場合" do
      it "有効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

    context "名前がない場合" do
      it "無効である" do
      end
    end

  end
end
