# test login
# User.create!(name: "Minh Tue",
#   email: "nvminhtue@gmail.com",
#   address: "16 Ly Thuong Kiet",
#   phone: "0905507959",
#   password: "123123",
#   password_confirmation: "123123",
#   role: 1
# )
# User.create!(name: "Ha Van Dong",
#   email: "dong@gmail.com",
#   address: "16 Ly Thuong Kiet",
#   phone: "0905507959",
#   password: "123123",
#   password_confirmation: "123123",
#   role: 1
# )

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
# /test login

# test category
# Category.create!(name: "Ghe")
# Category.create!(name: "Ghe van phong",parent_id: 1)
# Category.create!(name: "Ghe game",parent_id: 1)
# Category.create!(name: "Ghe van phong 1 sao",parent_id: 2)
# Category.create!(name: "Ghe van phong 5 sao",parent_id: 2)
# Category.create!(name: "Ghe giam doc",parent_id: 5)
# Category.create!(name: "Ghe game 123",parent_id: 3)
# Category.create!(name: "Ghe game 456",parent_id: 3)
# Category.create!(name: "Ban")
# /test category

# test hot trend
# Product.create!(name: "A",
#   description: "A",
#   category_id: 1,
#   quantity: 1,
#   price: 100
# )

# 12.times do
#   rand = 2+Random.rand(7)
#   Product.create!(name: Faker::Name.unique.name,
#     description: Faker::Lorem.sentence(4),
#     category_id: rand,
#     quantity: rand,
#     price: rand
#   )
# end

# 10.times do
#   user_id = 1+Random.rand(4)
#   o = Order.create!(user_id: user_id,
#     status: 1
#   )

#   4.times do
#     r = 1+Random.rand(12)
#     DetailOrder.create!(order_id: o.id,
#       product_id: r,
#       quantity: r,
#       price: r+1000000
#     )
#   end
# end
# /test hot trend

# test rating
# User.create!(name: "Minh Tue",
#   email: "nvminhtue@gmail.com",
#   address: "16 Ly Thuong Kiet",
#   phone: "0905507959",
#   password: "123123",
#   password_confirmation: "123123",
#   role: 1
# )
# User.create!(name: "Ha Van Dong",
#   email: "dong@gmail.com",
#   address: "16 Ly Thuong Kiet",
#   phone: "0905507959",
#   password: "123123",
#   password_confirmation: "123123",
#   role: 1
# )
# 4.times do |i|
#   rand = 2+Random.rand(7)
#   Product.create!(name: "sp #{i+1}",
#     description: "none",
#     image: "product/#{rand}.jpg",
#     category_id: rand,
#     quantity: rand,
#     price: rand
#   )
# end
# Rating.create!(user_id: 1, product_id: 1, rating: 1)
# Rating.create!(user_id: 2, product_id: 1, rating: 1)
# Rating.create!(user_id: 2, product_id: 2, rating: 2)
# Rating.create!(user_id: 2, product_id: 3, rating: 3)
# /test rating

# test sort
# Category.create!(name: "Ghe")
# Category.create!(name: "Ghe van phong",parent_id: 1)
# Category.create!(name: "Ghe game",parent_id: 1)
# Category.create!(name: "Ghe van phong 1 sao",parent_id: 2)
# Category.create!(name: "Ghe van phong 5 sao",parent_id: 2)
# Category.create!(name: "Ghe giam doc",parent_id: 5)
# Category.create!(name: "Ghe game 123",parent_id: 3)
# Category.create!(name: "Ghe game 456",parent_id: 3)
# Category.create!(name: "Ban")

# Product.create!(name: "A",
#   description: "none",
#   image: "product/2.jpg",
#   category_id: 1,
#   quantity: 1,
#   price: 1
# )

# Product.create!(name: "Z",
#   description: "none",
#   image: "product/4.jpg",
#   category_id: 1,
#   quantity: 1,
#   price: 1
# )

# 10.times do |i|
#   rand = 2+Random.rand(7)
#   Product.create!(name: Faker::Pokemon.name+"_"+i.to_s,
#     description: "none",
#     image: "product/2.jpg",
#     category_id: rand,
#     quantity: rand,
#     price: rand
#   )
# end
# /test sort

# test suggestion
# status = ["Pending", "Under Consideration", "Implemented", "Deleted"]
# Đang chờ xử lý, Đang xem xét, Đã triển khai, Đã xóa

# Suggestion.create!(user_id: 1,
#   name: "Quan ao",
#   description: "no",
#   category_id: 1,
#   status: status[0]
# )

# Suggestion.create!(user_id: 2,
#   name: "Quan ao nam 2008",
#   description: "no",
#   category_id: 1,
#   status: status[1]
# )

# Suggestion.create!(user_id: 1,
#   name: "Quan ao nu",
#   description: "no",
#   category_id: 1,
#   status: status[2]
# )

# Suggestion.create!(user_id: 1,
#   name: "Mu thoi trang",
#   description: "no",
#   category_id: 1,
#   status: status[2]
# )
# /test suggestion

# test manager order
# Category.create!(name: "Quan ao")
# Product.create!(name: "Quan 2018",
#   description: "none",
#   category_id: 1,
#   quantity: 1,
#   price: 1
# )
# Product.create!(name: "Ao 2010",
#   description: "none",
#   category_id: 1,
#   quantity: 1,
#   price: 1
# )

# Order.create!(user_id: 1,
#   status: "Pending",
#   total: 100
# )
# Order.create!(user_id: 2,
#   status: "Paid",
#   total: 100
# )

# DetailOrder.create(order_id: 1,
#   product_id: 1,
#   quantity: 1,
#   price: 1
# )
# DetailOrder.create(order_id: 1,
#   product_id: 2,
#   quantity: 1,
#   price: 1
# )
# DetailOrder.create(order_id: 2,
#   product_id: 1,
#   quantity: 1,
#   price: 1
# )

# /test manager order
