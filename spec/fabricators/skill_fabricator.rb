Fabricator(:skill) do
  title {Faker::Lorem.word }
  url {Faker::Company.name }
  description {Faker::Lorem.word}
end
