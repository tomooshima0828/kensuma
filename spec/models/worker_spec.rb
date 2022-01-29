require 'rails_helper'

RSpec.describe Worker, type: :model do

  it "名前、ある場合、有効である"
  it "名がない場合、無効である"
  it "姓がない場合、無効である" 
  it "メールアドレスがない場合、無効である" 
  it "重複したメールアドレスの場合、無効である"
  it "パスワードがない場合、無効である"

end
