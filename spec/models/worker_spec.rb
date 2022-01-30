require 'rails_helper'

RSpec.describe Worker, type: :model do
  before(:each) do
    @worker = build(:worker)
  end

  describe 'バリデーションのテスト' do
    context 'バリデーションに引っかからない場合' do
      it 'factorybotで作成したworkerが有効な状態である事' do
        expect(@worker).to be_valid
      end
    end

    context 'バリデーションに引っかかる場合' do
      it 'name(名前)が無ければ無効な状態である事' do
        @worker.name = ""
        @worker.valid?
        expect(@worker.errors[:name]).to include('を入力してください')
      end

      it 'name_kana(名前(カナ))が無ければ無効な状態である事' do
        @worker.name_kana = ""
        @worker.valid?
        expect(@worker.errors[:name_kana]).to include('を入力してください')
      end

      it 'name_kana(名前(カナ))がカタカナでなければ無効である事' do
        @worker.name_kana = "作業員１"
        @worker.valid?
        expect(@worker.errors[:name_kana]).to include('はカタカナで入力して下さい。')
      end

      it 'country(国籍)が無ければ無効な状態である事' do
        @worker.country = ""
        @worker.valid?
        expect(@worker.errors[:country]).to include('を入力してください')
      end

      it 'my_address(住所)が無ければ無効な状態である事' do
        @worker.my_address = ""
        @worker.valid?
        expect(@worker.errors[:my_address]).to include('を入力してください')
      end

      it 'my_phone_number(電話番号)が無ければ無効な状態である事' do
        @worker.my_phone_number = ""
        @worker.valid?
        expect(@worker.errors[:my_phone_number]).to include('を入力してください')
      end

      it 'my_phone_number(電話番号)が12桁の場合に無効な状態である事' do
        @worker.my_phone_number = "090123412345"
        @worker.valid?
        expect(@worker.errors[:my_phone_number]).to include('は不正な値です')
      end

      it 'my_phone_number(電話番号)が9桁の場合に無効な状態である事' do
        @worker.my_phone_number = "090123412"
        @worker.valid?
        expect(@worker.errors[:my_phone_number]).to include('は不正な値です')
      end

      it 'family_address(家族住所)が無ければ無効な状態である事' do
        @worker.family_address = ""
        @worker.valid?
        expect(@worker.errors[:family_address]).to include('を入力してください')
      end

      it 'family_phone_number(家族電話番号)が無ければ無効な状態である事' do
        @worker.family_address = ""
        @worker.valid?
        expect(@worker.errors[:family_address]).to include('を入力してください')
      end

      it 'family_phone_number(家族電話番号)が12桁の場合に無効な状態である事' do
        @worker.family_phone_number = "090123412345"
        @worker.valid?
        expect(@worker.errors[:family_phone_number]).to include('は不正な値です')
      end

      it 'family_phone_number(電話番号)が9桁の場合に無効な状態である事' do
        @worker.family_phone_number = "090123412"
        @worker.valid?
        expect(@worker.errors[:family_phone_number]).to include('は不正な値です')
      end

      it 'birth_day_on(生年月日)が無ければ無効な状態である事' do
        @worker.birth_day_on = ""
        @worker.valid?
        expect(@worker.errors[:birth_day_on]).to include('を入力してください')
      end

      it 'abo_blood_type(血液型)が無ければ無効な状態である事' do
        @worker.abo_blood_type = ""
        @worker.valid?
        expect(@worker.errors[:abo_blood_type]).to include('を入力してください')
      end

      it 'rh_blood_type(血液型)が無ければ無効な状態である事' do
        @worker.rh_blood_type = ""
        @worker.valid?
        expect(@worker.errors[:rh_blood_type]).to include('を入力してください')
      end

      it 'job_type(職種)が無ければ無効な状態である事' do
        @worker.job_type = ""
        @worker.valid?
        expect(@worker.errors[:job_type]).to include('を入力してください')
      end

      it 'hiring_on(雇入年月日)が無ければ無効な状態である事' do
        @worker.hiring_on = ""
        @worker.valid?
        expect(@worker.errors[:hiring_on]).to include('を入力してください')
      end

      it 'experience_term_before_hiring(雇入前経験年数)が無ければ無効な状態である事' do
        @worker.experience_term_before_hiring = ""
        @worker.valid?
        expect(@worker.errors[:experience_term_before_hiring]).to include('を入力してください')
      end
      
      it 'blank_term(ブランク年数)が無ければ無効な状態である事' do
        @worker.blank_term = ""
        @worker.valid?
        expect(@worker.errors[:blank_term]).to include('を入力してください')
      end
    end
  end
end
