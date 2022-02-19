require 'rails_helper'

RSpec.describe 'News', type: :system do
  let!(:admin) { create(:admin, email: 'foo@example.com', password: '123456', password_confirmation: '123456') }
  let!(:news_a) { create(:news, title: 'ニュースA', context: 'これはニュースAの内容です', status: 'draft', delivered_at: DateTime.now) }

  before(:each) do
    admin.save!
    news_a.save!
  end

  before(:each) do
    sign_in(admin)
    visit _system__dashboard_path
  end

  describe 'active_admin/devise/sessions' do
    describe 'ニュース一覧ページにアクセスした場合' do
      context 'ニュース一覧ページにアクセスした場合' do
        it 'ニュース一覧ページを表示' do
          click_link 'News'
          expect(page).to have_current_path _system__news_index_path, ignore_query: true
          expect(page).to have_content('News')
        end
      end
    end

    describe '編集ページに遷移' do
      before(:each) { visit _system__news_index_path }

      context '編集をクリックした場合' do
        it 'News編集ページを表示' do
          click_link '編集'
          expect(page).to have_current_path edit__system__news_path(news_a), ignore_query: true
          expect(page).to have_content('News を編集する')
        end
      end

      describe do
        before(:each) { visit edit__system__news_path(news_a) }

        context '編集する' do
          it '編集する' do
            fill_in 'news[title]', with: 'ニュースAの編集'
            fill_in 'news[context]', with: 'ニュースAの内容の編集です'
            select '2022', from: 'news[delivered_at(1i)]'
            select '1月', from: 'news[delivered_at(2i)]'
            select '1', from: 'news[delivered_at(3i)]'
            select '01', from: 'news[delivered_at(4i)]'
            select '01', from: 'news[delivered_at(5i)]'
            select 'Draft', from: 'news[status]'
            click_button 'Newsを更新'
            expect(page).to have_content('News の詳細')
          end
        end

        context '編集する' do
          it '編集する' do
            fill_in 'news[title]', with: nil
            fill_in 'news[context]', with: 'ニュースAの内容の編集です'
            select '2022', from: 'news[delivered_at(1i)]'
            select '1月', from: 'news[delivered_at(2i)]'
            select '1', from: 'news[delivered_at(3i)]'
            select '01', from: 'news[delivered_at(4i)]'
            select '01', from: 'news[delivered_at(5i)]'
            select 'Published', from: 'news[status]'
            click_button 'Newsを更新'
            expect(page).not_to have_content('News の詳細')
          end
        end
      end
    end
  end
end
