Fabricator(:user) do
  username {Faker::Lorem.word }
  password_digest 'password'
end
