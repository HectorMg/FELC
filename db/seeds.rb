# Company Accounts (9)
CompanyAccount.create!( name: "Company One",
                        market: "Food",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Company Two",
                        market: "Food",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!( name: "Company Three",
                        market: "Entertainment",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Company Four",
                        market: "Entertainment",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!( name: "Company Five",
                        market: "Public Services",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Company Six",
                        market: "Public Services",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!( name: "Company Seven",
                        market: "Wildcard",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Company Eight",
                        market: "Wildcard",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!( name: "The Bank",
                        balance: 1500)

# Users

User.create!( name: "Example User",
              email: "example@railstutorial.org",
              password:               "foobar",
              password_confirmation:  "foobar",
              balance: 1500,
              admin: true)
User.create!( name: "Hector Morales",
              email: "hectormgwake@gmail.com",
              password:               "foobar",
              password_confirmation:  "foobar",
              company_account_id: 1,
              balance: 1500,
              admin: false)
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!( name: name,
                email: email,
                balance: 1500,
                password:               password,
                password_confirmation:  password )
end


#Properites

Property.create!( name: "Ranchito",
                  price: 700,
                  bought_at: 700,
                  company_account_id: 9 )
Property.create!( name: "Arbol",
                  price: 200,
                  bought_at: 200,
                  company_account_id: 9)
Property.create!( name: "Cyber",
                  price: 150,
                  bought_at: 150,
                  company_account_id: 9)
#Stock

Stock.create!(name: "Aeromexico",
              abbrev: "AEROMX",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "Alfa",
              abbrev: "ALFA",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "América Móvil",
              abbrev: "AMX",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "Bachoco",
              abbrev: "BAC",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "BBVA",
              abbrev: "BBVA",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "CEMEX",
              abbrev: "CMX",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "Vitro",
              abbrev: "VIT",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
Stock.create!(name: "Walmart",
              abbrev: "WMT",
              quantity: 500,
              total_quantity: 500,
              price: 25,
              previous_price: 0,
              market_cap: 12500)
