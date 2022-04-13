require 'rails_helper'

RSpec.describe 'Documnents', type: :system do
  let(:user) { create(:user) }
  let(:business) { create(:business, user: user) }
  let(:order) { create(:order, business: business) }
  let(:request_order) { create(:request_order, business: business, order: order) }
  let(:document) { create(:document, business: business, request_order: request_order) }

  describe '書類関連' do
    before(:each) do
      user.skip_confirmation!
      user.save!
      business.save!
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'

      document_pages = 3
      document_pages.times do |page|
        create(:document, request_order: request_order, business: business, document_type: page)
      end
    end

    it 'ログイン後発注一覧画面へ遷移できること' do
      visit users_request_order_documents_path(request_order)
      expect(page).to have_content '書類一覧'
    end

    context '表紙' do
      before(:each) do
        @cover = Document.find_by(document_type: 0)
        @cover.content = (
          {
            'business_name': 'test1',
            'submitted_on':  '2022-01-01'
          }
        )
        @cover.save
      end

      it '表紙の詳細画面へ遷移できること' do
        visit users_request_order_document_path(request_order, @cover)
        expect(page).to have_content '表紙'
        expect(page).to have_content 'test1'
        expect(page).to have_content '2022-01-01'
      end

      it '表紙の編集後、詳細画面へリダイレクトできること' do
        visit edit_users_request_order_document_path(request_order, @cover)
        expect(page).to have_content '表紙編集'

        (all('#document_content')[0]).set('edit1')
        (all('#document_content')[1]).set('2022-12-31')
        click_button '登録'

        visit users_request_order_document_path(request_order, @cover)
        expect(page).to have_content '表紙'
        expect(page).to have_content 'edit1'
        expect(page).to have_content '2022-12-31'
      end
    end

    context '目次' do
      before(:each) do
        @table = Document.find_by(document_type: 1)
      end

      it '目次の詳細画面へ遷移できること' do
        visit users_request_order_document_path(request_order, @table)
        expect(page).to have_content '目次'
      end
    end

    context '施工体制台帳作成建設工事の通知' do
      before(:each) do
        @doc_2nd = Document.find_by(document_type: 2)
        @doc_2nd.content = (
          {
            'submitted_on':           '2022-01-01',
            'prime_contractor_name':  'test1',
            'site_name':              'test2',
            'business_name':          'test3',
            'orderer_name':           'test4',
            'construction_name':      'test5',
            'supervisor_name':        'test6',
            'apply':                  'test7',
            'submission_destination': 'test8'
          }
        )
        @doc_2nd.save
      end

      it '施工体制台帳作成建設工事の通知の詳細画面へ遷移できること' do
        visit users_request_order_document_path(request_order, @doc_2nd)
        expect(page).to have_content '全建統⼀様式第２号(施⼯体制台帳作成建設⼯事の通知)'
        expect(page).to have_content '2022-01-01'
        expect(page).to have_content 'test1'
        expect(page).to have_content 'test2'
        expect(page).to have_content 'test3'
        expect(page).to have_content 'test4'
        expect(page).to have_content 'test5'
        expect(page).to have_content 'test6'
        expect(page).to have_content 'test7'
        expect(page).to have_content 'test8'
      end

      it '施工体制台帳作成建設工事の通知の編集後、詳細画面へリダイレクトできること' do
        visit edit_users_request_order_document_path(request_order, @doc_2nd)
        expect(page).to have_content '全建統⼀様式第２号(施⼯体制台帳作成建設⼯事の通知)編集'
        (all('#document_content')[0]).set('2020-12-31')
        (all('#document_content')[1]).set('edit1')
        (all('#document_content')[2]).set('edit2')
        (all('#document_content')[3]).set('edit3')
        (all('#document_content')[4]).set('edit4')
        (all('#document_content')[5]).set('edit5')
        (all('#document_content')[6]).set('edit6')
        (all('#document_content')[7]).set('edit7')
        (all('#document_content')[8]).set('edit8')
        click_button '登録'

        visit users_request_order_document_path(request_order, @doc_2nd)
        expect(page).to have_content '全建統⼀様式第２号(施⼯体制台帳作成建設⼯事の通知)'
        expect(page).to have_content '2020-12-31'
        expect(page).to have_content 'edit1'
        expect(page).to have_content 'edit2'
        expect(page).to have_content 'edit3'
        expect(page).to have_content 'edit4'
        expect(page).to have_content 'edit5'
        expect(page).to have_content 'edit6'
        expect(page).to have_content 'edit7'
        expect(page).to have_content 'edit8'
      end
    end
  end
end
