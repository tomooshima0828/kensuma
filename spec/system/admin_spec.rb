require 'rails_helper'

RSpec.describe "Admins", type: :system do
  # テストユーザーを作成する
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  describe 'active_admin/devise/sessions' do
    context '管理者ログインページへアクセスした場合' do
      it 'ログイン画面を表示' do
        visit new_admin_session_path
        expect(page).to have_content('ログイン')
      end
    end

    context 'メールアドレスとパスワードが登録済み情報と合致する場合' do
      it 'ログインしダッシュボードを表示' do
        login(admin)
        # ログイン後遷移先変更時に修正の必要あり
        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content('ログインしました。')
      end
    end

    context 'メールアドレスとパスワードが登録済み情報と合致しない場合' do
      it 'ログインできない' do
        visit new_admin_session_path
        fill_in 'admin[email]', with: 'foo@email.com'
        fill_in 'admin[password]', with: '123456'
        click_button 'ログイン'
        expect(current_path).to eq new_admin_session_path
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
    
    context 'メールアドレスとパスワードが未入力の場合' do
      it 'ログインできない' do
        visit new_admin_session_path
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_admin_session_path
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end

    context 'ログアウトをクリックした場合' do
      it 'ログアウトしログイン画面を表示' do
        login(admin)
        click_link 'ログアウト'
        expect(current_path).to eq new_admin_session_path
        expect(page).to have_content('ログイン')
      end
    end
  end
  
  describe '管理者ログイン後' do
    before { login(admin) }
    describe 'ヘッダーからの画面遷移' do
      context 'ダッシュボードをクリックした場合' do
        it 'ダッシュボードを表示' do
          click_link 'ダッシュボード'
          expect(current_path).to eq admin_dashboard_path
          expect(page).to have_content('ダッシュボード')
        end
      end

      context 'Adminsをクリックした場合' do
        it 'Admins一覧を表示' do
          click_link 'Admins'
          expect(current_path).to eq admin_admins_path
          expect(page).to have_content('Admins')
        end
      end

      context 'Commentsをクリックした場合' do
        it 'Comments一覧を表示' do
          click_link 'Comments'
          expect(current_path).to eq admin_comments_path
          expect(page).to have_content('Comments')
        end
      end

      context 'ユーザーをクリックした場合' do
        it 'ユーザー一覧を表示' do
          click_link 'ユーザー'
          expect(current_path).to eq admin_users_path
          expect(page).to have_content('ユーザー')
        end
      end
    end

    describe '管理者一覧ページからの遷移' do
      before { visit admin_admins_path }

      context '閲覧をクリックした場合' do
        it '管理者詳細ページを表示' do
          click_link '閲覧'
          expect(current_path).to eq admin_admin_path(admin)
          expect(page).to have_content('Admin の詳細')
        end
      end

      context '編集をクリックした場合' do
        it '管理者編集ページを表示' do
          click_link '編集'
          expect(current_path).to eq edit_admin_admin_path(admin)
          expect(page).to have_content('Admin を編集する')
        end
      end
    end

    describe 'ユーザー一覧ページからの遷移' do
      before { visit admin_users_path }
      context 'ユーザーを作成するをクリックした場合' do
        it 'ユーザー登録ページを表示' do
          click_link 'ユーザー を作成する'
          expect(current_path).to eq new_admin_user_path
          expect(page).to have_content('ユーザー を作成する')
        end
      end

      context '閲覧をクリックした場合' do
        it 'ユーザー詳細ページを表示' do
          click_link '閲覧'
          expect(current_path).to eq admin_user_path(user)
          expect(page).to have_content('ユーザー の詳細')
        end
      end

      context '編集をクリックした場合' do
        it 'ユーザー編集ページを表示' do
          click_link '編集'
          expect(current_path).to eq edit_admin_user_path(user)
          expect(page).to have_content('ユーザー を編集する')
        end
      end

      # ↓エラーが出る？
      # context '削除をクリックした場合' do
        # it 'ダイアログを表示' do
        # end
      # end
    end

    describe 'Admin詳細ページからの遷移' do
      before { visit admin_admin_path(admin) }
      context 'Adminを編集するをクリックした場合' do
        it '管理者編集ページを表示' do
          click_link 'Admin を編集する'
          expect(current_path).to eq edit_admin_admin_path(admin)
          expect(page).to have_content('Admin を編集する')
        end
      end
    end

    describe 'ユーザー詳細ページからの遷移' do
      before { visit admin_user_path(user) }
      context 'ユーザーを編集するをクリックした場合' do
        it 'ユーザー編集ページを表示' do
          click_link 'ユーザー を編集する'
          expect(current_path).to eq edit_admin_user_path(user)
          expect(page).to have_content('ユーザー を編集する')
        end
      end

      # ↓エラーが出る?
      # context 'ユーザーを削除するをクリックした場合' do
      #   it 'ダイアログを表示' do
      #   end
      # end
    end
  end
end