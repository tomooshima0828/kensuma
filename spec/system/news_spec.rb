require 'rails_helper'

RSpec.describe 'News', type: :system do
  let!(:admin) { create(:admin, email: 'foo@example.com', password: '123456', password_confirmation: '123456') }
  let!(:news_a) { create(:news, title: 'お知らせ-A', content: 'これはお知らせ-Aの内容です', status: 'draft', delivered_at: DateTime.now) }

  before(:each) do
    sign_in(admin)
    visit _system__dashboard_path
  end

  describe 'お知らせ一覧ページ' do
    it 'お知らせ一覧ページを表示' do
      click_link 'お知らせ'
      expect(page).to have_current_path _system__news_index_path, ignore_query: true
      expect(page).to have_content('お知らせ')
    end
  end

  describe 'お知らせ一覧ページにアクセスした場合' do
    before(:each) { visit _system__news_index_path }

    context 'お知らせ編集をクリックした場合' do
      it do
        click_link '編集'
        expect(page).to have_current_path edit__system__news_path(news_a), ignore_query: true
        expect(page).to have_content('お知らせ を編集する')
      end
    end

    describe 'お知らせ編集ページ' do
      before(:each) { visit edit__system__news_path(news_a) }

      context 'お知らせ編集ページを表示(正常系)' do
        it 'お知らせ編集ページで各項目を入力(正常系)' do
          fill_in 'news[title]', with: 'お知らせ-Aの編集'
          fill_in 'news[content]', with: 'お知らせ-Aの内容の編集です'
          select '2022', from: 'news[delivered_at(1i)]'
          select '1月', from: 'news[delivered_at(2i)]'
          select '1', from: 'news[delivered_at(3i)]'
          select '01', from: 'news[delivered_at(4i)]'
          select '01', from: 'news[delivered_at(5i)]'
          select 'Draft', from: 'news[status]'
          click_button 'お知らせを更新'
          expect(page).to have_content('お知らせ')
        end
      end

      context 'お知らせ編集ページを表示(異常系)' do
        it 'お知らせ編集ページで各項目を入力(異常系)' do
          # 入力項目に空が一つでもあると、'published'では更新できない
          fill_in 'news[title]', with: nil
          fill_in 'news[content]', with: 'お知らせ-Aの内容の編集です'
          select '2022', from: 'news[delivered_at(1i)]'
          select '1月', from: 'news[delivered_at(2i)]'
          select '1', from: 'news[delivered_at(3i)]'
          select '01', from: 'news[delivered_at(4i)]'
          select '01', from: 'news[delivered_at(5i)]'
          select 'Published', from: 'news[status]'
          click_button 'お知らせを更新'
          expect(page).not_to have_content('お知らせ の詳細')
        end
      end
    end
  end
end
