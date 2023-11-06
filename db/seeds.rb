require "faker"
require "csv"

Product.delete_all
Category.delete_all

filename = Rails.root.join("db/products.csv")
puts "Loading data from csv file: #{filename}"
csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |product_data|
  category = Category.find_or_create_by(name: product_data["category"])
  product = Product.find_or_create_by(
    title:          product_data["name"],
    description:    product_data["description"],
    price:          product_data["price"],
    stock_quantity: product_data["stock quantity"],
    category:
  )
end

Customer.create(full_name: "John Doe", phone_number: "123-456-7890", email_address: "john@example.com", notes: "Some notes")
Customer.create(full_name: "Jane Smith", phone_number: "987-654-3210", notes: "More notes")
Customer.create(full_name: "aaaaaaaa", phone_number: "123-876-7810", email_address: "aaaaa@example.com", notes: "aaaaaa")
Customer.create(full_name: "bbbbbbbb", phone_number: "911-554-3999", notes: "bbbbb")
Customer.create(full_name: "cccccccc", phone_number: "123-888-7810", email_address: "ccccc@example.com", notes: "cccccc")