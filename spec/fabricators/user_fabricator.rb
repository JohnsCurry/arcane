Fabricator(:user) do
  username {Faker::Lorem.word }
  password 'password'
end
