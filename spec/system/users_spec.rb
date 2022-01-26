require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { build(:user) }

  let(:general_user) { build(:user, admin_user_id: user.id) }

  let(:business) { build(:business, user: user) }

  describe 'その他ユーザーCRUD' do
    before(:each) do
      user.skip_confirmation!
      user.save!
      # 事業所登録
      business.save!
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      # その他ユーザー一覧画面へ
      visit users_general_users_path
    end

    context '画面遷移（新規作成前）' do
      it 'その他ユーザー新規作成' do
        visit new_users_general_user_path

        fill_in 'user[name]', with: general_user.name
        fill_in 'user[email]', with: general_user.email
        fill_in 'user[age]', with: general_user.age
        select '男', from: 'user_gender'
        fill_in 'user[password]', with: general_user.password
        click_button '登録'
        # その他ユーザー詳細画面へ遷移することを期待する
        expect(page).to have_current_path users_general_user_path(2), ignore_query: true
        # 遷移されたページに'その他ユーザー詳細'の文字列があることを期待する
        expect(page).to have_content 'その他ユーザー詳細'
        # 遷移されたページに'#{general_user.name}'の文字列があることを期待する
        expect(page).to have_content general_user.name
      end
    end

    context '画面遷移（新規作成後）' do
      it 'その他ユーザー編集' do
        # その他ユーザー登録
        general_user.save!
        visit edit_users_general_user_path(general_user)

        fill_in 'user[name]', with: general_user.name
        fill_in 'user[email]', with: general_user.email
        fill_in 'user[age]', with: general_user.age
        select '男', from: 'user_gender'
        fill_in 'user[password]', with: general_user.password
        click_button '更新'

        # その他ユーザー詳細画面へ遷移することを期待する
        expect(page).to have_current_path users_general_user_path(general_user), ignore_query: true
        # 遷移されたページに'その他ユーザー詳細'の文字列があることを期待する
        expect(page).to have_content 'その他ユーザー詳細'
        # 遷移されたページに'#{general_user.name}'の文字列があることを期待する
        expect(page).to have_content general_user.name
      end
    end
  end
end
