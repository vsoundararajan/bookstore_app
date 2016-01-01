Fabricator(:book) do 
  #post :create, publisher: Fabricate.attributes_for(:publisher, name: "Test")
  title { Faker::Name.title }
  isbn { Faker::Code.isbn }
  description { Faker::Lorem.sentence }
  publisher_id { Faker::Number.between(1, 50 ) }
  published_at { Faker::Date.backward(14) }
  page_count { Faker::Number.between(1, 5000) }
  price { Faker::Number.decimal(6, 2) }
end
