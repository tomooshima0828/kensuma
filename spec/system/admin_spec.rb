require 'rails_helper'

RSpec.describe "Admin_test", type: :system do
  
  describe 'active_admin/devise/sessions' do
    context '管理者ログインページへアクセス時' do
      it '管理者用のログイン画面が表示されること' do
      end
    end
    context 'メールアドレスとパスワードを入力' do
      it '管理者登録情報と合致すればログインができること' do
      end
    end
    context 'メールアドレスとパスワード未入力' do
      it 'ログインできずメッセージと共にログイン画面が再度表示されること' do
      end
    end
    context 'ログアウト後' do
      it 'メッセージと共にログイン画面に遷移すること'
      end
    end
  end
  
  describe 'admin/dashboard' do
    context '管理者ログイン後' do
      context 'ヘッダーリンクをクリックした場合' do
        it 'ダッシュボードが表示されること' do
        end
      end
    end
  end

  describe 'admin/admins' do
    context '管理者ログイン後' do
      context 'ヘッダーリンクをクリックした場合' do
        it 'コメント一覧が表示されること' do
        end
      end
      context '閲覧リンクをクリックした場合' do
        it '管理者情報詳細ページへ遷移すること' do
        end
      end
      context '編集リンクをクリックした場合' do
        it '管理者情報編集ページへ遷移すること' do
        end
      end
    end
  end

  describe 'admin/comments' do
    context '管理者ログイン後' do
      context 'ヘッダーリンクをクリックした場合' do
        it 'コメント一覧が表示されること' do
        end
      end
    end
  end

  describe 'admin/users' do
    context '管理者ログイン後' do
      context 'ヘッダーリンクをクリックした場合' do
        it 'ユーザー一覧が表示されること' do
        end
      end
      context '閲覧リンクをクリックした場合' do
        it '管理者情報詳細ページへ遷移すること' do
        end
      end
      context '編集リンクをクリックした場合' do
        it '管理者情報編集ページへ遷移すること' do
        end
      end
    end
  end
end

# RSpec.describe 'Admins', type: :system do
#   before do
#     @admin = Admin.create!(email: 'foo@example.com', password: '123456')
#   end

#   describe "ログイン後の画面表示" do
#     context "ログインできる時" do
#       it '保存済みのadmin情報と合致すればログイン出来ダッシュボードに遷移する' do
#         visit new_admin_session_path
#         fill_in 'admin[email]', with: 'foo@example.com'
#         fill_in 'admin[password]', with: '123456'
#         click_on 'ログイン'
#         expect(current_path).to eq(_system__dashboard_path)
#         expect(page).to have_content 'ダッシュボード'
#       end  
#     end

#     context "ログイン出来ない時" do
#       context "入力値空欄の場合" do
#         it 'エラーと共にログイン画面が表示される' do
#           visit new_admin_session_path
#           fill_in 'admin[email]', with: ''
#           fill_in 'admin[password]', with: ''
#           click_on 'ログイン'
#           expect(current_path).to eq(new_admin_session_path)
#           expect(page).to have_content 'Eメールまたはパスワードが違います。'
#         end
#       end

#       context "保存済みのadmin情報と合致しない場合" do
#         it 'エラーと共にログイン画面が表示される' do
#           visit new_admin_session_path
#           fill_in 'admin[email]', with: 'bar@example.com'
#           fill_in 'admin[password]', with: '654321'
#           click_on 'ログイン'
#           expect(current_path).to eq(new_admin_session_path)
#           expect(page).to have_content 'Eメールまたはパスワードが違います。'
#         end
#       end
#     end
#   end

#   describe "ログアウト後の画面表示" do
#     context "ログアウト時" do
#       it 'adminのログイン画面に遷移する' do
#         visit new_admin_session_path
#         fill_in 'admin[email]', with: 'foo@example.com'
#         fill_in 'admin[password]', with: '123456'
#         click_on 'ログイン'
#         expect(current_path).to eq(_system__dashboard_path)
#         expect(page).to have_content 'ダッシュボード'
#         click_on 'ログアウト'
#         expect(current_path).to eq(admin_session_path)
#         expect(page).to have_content 'ログイン'
#       end
#     end
#   end

#   describe "ヘッダーのリンククリック後の画面" do
#     context "adminがログインしている時" do
#       before do
#         sign_in(@admin)
#         visit _system__dashboard_path
#       end

#       context "ダッシュボードクリック時" do
#         it 'ダッシュボード画面に遷移' do
#           click_on 'ダッシュボード'
#           expect(current_path).to eq(_system__dashboard_path)
#           expect(page).to have_content 'ダッシュボード'
#         end
#       end

#       context "Adminsクリック時" do
#         it 'admin一覧画面に遷移' do
#           click_on 'Admins'
#           expect(current_path).to eq(_system__admins_path)
#           expect(page).to have_content 'Admins'
#         end
#       end

#       context "Commentsクリック時" do
#         it 'comment一覧画面に遷移' do
#           click_on 'Comments'
#           expect(current_path).to eq(_system__comments_path)
#           expect(page).to have_content 'Comments'
#         end
#       end

#       context "ユーザークリック時" do
#         it 'ユーザー一覧画面に遷移' do
#           click_on 'ユーザー'
#           expect(current_path).to eq(_system__users_path)
#           expect(page).to have_content 'Comments'
#         end
#       end
#     end
#   end

#   describe "admin一覧画面からのCRUD遷移テスト" do
#     before do
#       sign_in(@admin)
#       visit _system__dashboard_path
#       click_on 'Admins'
#       visit _system__admins_path
#     end
#     context "閲覧クリック時" do
#       it '閲覧画面に遷移' do
#         click_on '閲覧'
#         expect(current_path).to eq(_system__admin_path(@admin))
#       end
#     end
#     context "編集クリック時" do
#       it '編集画面に遷移' do
#         click_on '編集'
#         expect(current_path).to eq(edit__system__admin_path(@admin))
#       end
#     end
#     # adminの削除ボタンは必要かどうかまだ不明の為一旦記載無
#   end

#   describe "ユーザー一覧画面からのCRUD遷移テスト" do
#     let!(:user) { create(:user) }
#     before do
#       sign_in(@admin)
#       visit _system__dashboard_path
#       click_on 'ユーザー'
#       visit _system__users_path
#     end
#     context "ユーザーを作成するボタンをクリック時" do
#       it 'ユーザー作成画面に遷移' do
#         click_on 'ユーザー を作成する'
#         expect(current_path).to eq(new__system__user_path)
#       end
#     end

#     context "閲覧クリック時" do
#       it '閲覧画面に遷移' do
#         click_on '閲覧', match: :first
#         expect(current_path).to eq(_system__user_path(user))
#       end
#     end

#     context "編集クリック時" do
#       it '編集画面に遷移' do
#         click_on '編集', match: :first
#         expect(current_path).to eq(edit__system__user_path(user))
#       end
#     end
#   end
# end