# user
User.create!(name: "Minh Tue",
  email: "nvminhtue@gmail.com",
  address: "16 Ly Thuong Kiet",
  phone: "0905507959",
  password: "123123",
  password_confirmation: "123123",
  role: 1
)
User.create!(name: "Ha Van Dong",
  email: "dong@gmail.com",
  address: "16 Ly Thuong Kiet",
  phone: "0905507959",
  password: "123123",
  password_confirmation: "123123",
  role: 1
)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = "16 Ly Thuong Kiet"
  phone = "0905507959"

  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    address: address,
    phone: phone)
end

# product
Product.create!(name: "ssd",
  description: "abc",
  quantity: 1,
  price: 100
)

19.times do
  rand = 2+Random.rand(7)
  Product.create!(name: Faker::Name.unique.name,
    description: Faker::Lorem.sentence(4),
    image: "product/#{rand}.jpg",
    quantity: rand,
    price: rand
  )
end

# order
4.times do
  user_id = 1+Random.rand(4)
  o = Order.create!(user_id: user_id,
    status: "purchased"
  )

  2.times do
    r = 1+Random.rand(9)
    OrderDetail.create!(order_id: o.id,
      poroduct_id: r,
      quantity: r,
      price: r+1000000
    )
  end
end
