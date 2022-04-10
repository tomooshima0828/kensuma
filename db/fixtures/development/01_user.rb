5.times do |n|
  User.seed(:id,
    {
      email: "test_user#{n+1}@gmail.com",
      name: "テストuser#{n+1}",
      password: 'password',
      password_confirmation: 'password',
      role: 'admin',
      confirmed_at: Time.now
    }
  )
end

3.times do |n|
  User.seed(:id,
    {
      email: "general_user#{n+1}@gmail.com",
      name: "一般user#{n+1}",
      password: 'password',
      password_confirmation: 'password',
      role: 'general',
      confirmed_at: Time.now,
      admin_user_id: 1
    }
  )
end
