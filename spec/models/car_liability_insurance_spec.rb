require 'rails_helper'

RSpec.describe CarLiabilityInsurance, type: :model do
  let :company do
    create(:car_insurance_company)
  end

  let :car do
    create(:car)
  end

  let :liability do
    create(:car_liability_insurance, company_liability: company, car_liability: car)
  end

  describe 'アソシエーションについて' do
    context '紐つく車両がある場合' do
      subject do
        liability.car_liability
      end

      it '紐つく車両を返すこと' do
        expect(subject).to eq(car)
      end
    end

    context '紐つく保険会社がある場合' do
      subject do
        liability.company_liability
      end

      it '紐つく保険会社を返すこと' do
        expect(subject).to eq(company)
      end
    end
  end
end
