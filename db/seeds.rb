User.create!(name: "Minh Tue",
  email: "nvminhtue@gmail.com",
  address: "16 Ly Thuong Kiet",
  phone: "0905507959",
  password: "123123",
  password_confirmation: "123123",
  role: 1)

99.times do |n|
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
