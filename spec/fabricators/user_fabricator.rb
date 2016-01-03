Fabricator(:user) do 
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email {Faker::Internet.safe_email }
  password {Faker::Internet.password(10, 20) }
  admin false
end

Fabricator(:admin, from: :user) do
  admin true
end