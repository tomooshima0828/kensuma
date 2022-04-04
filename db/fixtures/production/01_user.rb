User.seed(:id,
  {
    id: 1,
    email: 'test_user1@gmail.com',
    name: 'テストuser1',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin',
    confirmed_at: Time.now
  },
  {
    id: 2,
    email: 'test_user2@gmail.com',
    name: 'テストuser2',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin',
    confirmed_at: Time.now
  },
  {
    id: 3,
    email: 'test_user3@gmail.com',
    name: 'テストuser3',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin',
    confirmed_at: Time.now
  },
  {
    id: 4,
    email: 'test_user4@gmail.com',
    name: 'テストuser4',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin',
    confirmed_at: Time.now
  },
  {
    id: 5,
    email: 'test_user5@gmail.com',
    name: 'テストuser5',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin',
    confirmed_at: Time.now
  },
  {
    id: 6,
    email: 'general_user1@gmail.com',
    name: '一般user1',
    password: 'password',
    password_confirmation: 'password',
    role: 'general',
    confirmed_at: Time.now
  }
)
