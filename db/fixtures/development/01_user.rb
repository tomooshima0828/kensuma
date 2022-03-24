User.seed(:id,
  {
    id: 1,
    email: 'test_user1@gmail.com',
    name: 'テストuser1',
    password: 'password',
    password_confirmation: 'password',
    role: 1,
    confirmed_at: Time.now
  },
  {
    id: 2,
    email: 'test_user2@gmail.com',
    name: 'テストuser2',
    password: 'password',
    password_confirmation: 'password',
    confirmed_at: Time.now
  }
)
