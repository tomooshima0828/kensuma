# frozen_string_literal: true

# User
unless User.exists?
  1.times do |i|
    user = User.new(
      email: "test_user#{i}@gmail.com", # sample: test_user1@gmail.com
      name: "テストuser#{i}",
      password: 'password'
    )

    user.skip_confirmation! # deviseの確認メールをスキップ
    user.save!
  end
end

SeedFu.seed
