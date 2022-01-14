require 'rails_helper'

RSpec.describe 'Businesses', type: :system do

  let(:user) { create(:user) }

  let(:business) { create(:business) }

  describe 'Business CRUD' do
    describe '事業所新規登録' do
      before { binding.pry
        login_as(user) }
      context 'フォームの入力値が正常', use_truncation: false do
        it '事業所の新規作成が成功' do
          # ユーザー新規登録画面へ遷移
          visit new_user_session_path
          # uuidテキストフィールドに1と入力
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password

          click_button 'ログイン'
          expect(current_path).to eq new_users_businesses_path
          # # nameテキストフィールドにtestと入力
          # fill_in 'name', with: 'test'
          # # name_kanaテキストフィールドにテストと入力
          # fill_in 'name_kana', with: 'テスト'
          # # branch_nameテキストフィールドにtestと入力
          # fill_in 'branch_name', with: 'test'
          # # representative_nameテキストフィールドにtestと入力
          # fill_in 'representative_name', with: 'test'
          # # emailテキストフィールドにtest@email.comと入力
          # fill_in 'email', with: 'test@email.com'
          # # paddressテキストフィールドにtestと入力
          # fill_in 'address', with: 'test'
          # # post_codeテキストフィールドに0123456と入力
          # fill_in 'post_code', with: '0123456'
          # # phone_numberテキストフィールドに0123456789と入力
          # fill_in 'phone_number', with: '0123456789'
          # # carrier_up_idテキストフィールドに1と入力
          # fill_in 'carrier_up_id', with: '1'
          # # 登録と記述のあるsubmitをクリックする
          # click_button '登録'
          # # new_user_bmr_pathへ遷移することを期待する
          # expect(current_path).to eq users_businesses_path
          # # 遷移されたページに'基本設定'の文字列があることを期待する
          # expect(page).to have_content 'test（テスト）'
        end
      end
    end
  end
end
