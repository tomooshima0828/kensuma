require 'rails_helper'

RSpec.describe Worker, type: :model do
  let(:worker) do
    build(:worker, 
      name: 'TestWorker',
      name_kana: 'テストワーカー',
      country: '東京都',
      my_phone_number: '090-1234-5678',
      family_address: '東京都',
      family_phone_number: '080-8765-4321',
      birth_day_on: '2022-01-20',
      abo_blood_type: 0,
      rh_blood_type: 0,
      job_type: 0,
      hiring_on: '2022-01-01',
      experience_term_before_hiring: 0,
      blank_term: 0,
      carrier_up_id: 'test_carrier_id',
      images: '',
      businesses_id: 1
    )
  end

  describe "バリデーションのテスト" do
    context "名前、名前カナ、国籍、住所、電話番号、家族住所、家族電話番号、生年月日、血液型(ABO)、血液型(+-)、職種、雇入年月日、雇入前経験年数、ブランク年数、business_idがある場合" do
      it "有効である" do
        expect(worker).to be_valid
      end
    end

    # context "名前がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "名前カナがない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "国籍がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "住所がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "電話番号がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "家族住所がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "家族電話番号がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "生年月日がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "血液型（ABO）がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "血液型（+-）がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "職種がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "雇入年月日がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "雇入前経験年数がない場合" do
    #   it "無効である" do
    #   end
    # end

    # context "ブランク年数がない場合" do
    #   it "無効である" do
    #   end
    # end
  end
end
