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

9.times do |n|
  n = n + 1
  p_name  = "Product #{n}"
  p_description = "description"
  p_category = "None"
  p_price = "#{n*1000000}"
  p_rate = 4.5

  Product.create!(name: p_name,
    description: p_description,
    image: "product/default-product.jpg",
    category: p_category,
    price: p_price,
    rate: p_rate)
end

