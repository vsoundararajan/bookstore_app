Fabricator(:order_item) do
  order
  book
  price { Faker::number.number(2) }
  quantity { Faker::Number.number(2) }
end