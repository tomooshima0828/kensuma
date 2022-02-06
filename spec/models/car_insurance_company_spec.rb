require 'rails_helper'

RSpec.describe CarInsuranceCompany, type: :model do
  let :company do
    create(:car_insurance_company)
  end

  let :cars do
    create_list(:car, 2)
  end

  describe '車両とのアソシエーションについて' do
    context '紐つく車両がある場合' do
      subject do
        company.car_voluntaries << cars
      end

      it '紐つく車両を返すこと' do
        expect(subject).to eq(cars)
      end
    end
  end
end
