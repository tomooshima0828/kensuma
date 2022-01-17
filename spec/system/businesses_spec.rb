require 'rails_helper'

RSpec.describe 'Businesses', type: :system do
  let(:user) { create(:user) }

  let(:business) { create(:business) }

  describe '事業所関連' do
    before {
      user.skip_confirmation!
      user.save!
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    }
    context '画面への推移が正常' do
      it '事業所新規作成' do
        # 事業所新規登録画面へ遷移
        visit new_users_business_path
        # new_users_businesses_pathへ遷移することを期待する
        expect(current_path).to eq new_users_business_path
        # 遷移されたページに'事業所登録'の文字列があることを期待する
        expect(page).to have_content '事業所登録'
      end
    end
  end
end