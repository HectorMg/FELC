# Company Accounts (9)
CompanyAccount.create!( name: "Food 1",
                        market: "Food",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Food 2",
                        market: "Food",
                        numerator: 2,
                        balance: 1500)
# CompanyAccount.create!name: "",(
                        # market: "Entertainment",
#                         numerator: 1,
#                         balance: 1500)
# CompanyAccount.create!name: "",(
                        # market: "Entertainment",
#                         numerator: 2,
#                         balance: 1500)
CompanyAccount.create!( name: "Public Services 1",
                        market: "Public Services",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!( name: "Public Services 2",
                        market: "Public Services",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!(name: "Wildcard 1",
                        market: "Wildcard",
                        numerator: 1,
                        balance: 1500)
CompanyAccount.create!(name: "Wildcard 2",
                        market: "Wildcard",
                        numerator: 2,
                        balance: 1500)
CompanyAccount.create!( name: "The Bank",
                        balance: 1500)

# Users

User.create!( name: "Admin",
              email: "admin@felc.com",
              password:               "cscfelc16",
              password_confirmation:  "cscfelc16",
              balance: 0,
              company_account_id: 7,
              admin: true)

User.create!( name: "Diego Pasquel",
              email: "dpasquel@felc.com",
              password:               "dpasquel",
              password_confirmation:  "dpasquel",
              balance: 0,
              company_account_id: 7,
              admin: true)

User.create!( name: "Larisa Morales",
              email: "lmorales@felc.com",
              password:               "lmorales",
              password_confirmation:  "lmorales",
              balance: 0,
              company_account_id: 7,
              admin: true)

User.create!( name: "Ale Hanun",
              email: "alehanun@felc.com",
              password:               "ahanun",
              password_confirmation:  "ahanun",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Andrea Martínez",
              email: "andreamartinez@felc.com",
              password:               "amartinez",
              password_confirmation:  "amartinez",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Paola Morales",
              email: "paolamorales@felc.com",
              password:               "pmorales",
              password_confirmation:  "pmorales",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Paola Alanís",
              email: "paolaalanis@felc.com",
              password:               "palanis",
              password_confirmation:  "palanis",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Mafer Rico",
              email: "maferrico@felc.com",
              password:               "mfrico",
              password_confirmation:  "mfrico",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Marcelo Leal",
              email: "marceloleal@felc.com",
              password:               "maleal",
              password_confirmation:  "maleal",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Fernando Carrillo",
              email: "fernandocarrillo@felc.com",
              password:               "fcarrillo",
              password_confirmation:  "fcarrillo",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Fer de la Torre",
              email: "ferdelatorre@felc.com",
              password:               "fdelatorre",
              password_confirmation:  "fdelatorre",
              company_account_id: 7,
              balance: 0,
              admin: true)

User.create!( name: "Montse Muñoz",
              email: "montsemunoz@felc.com",
              password:               "mmunoz",
              password_confirmation:  "mmunoz",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Mariana Martínez",
              email: "marianamartinez@felc.com",
              password:               "mmartinez",
              password_confirmation:  "mmartinez",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Juan Pablo Arce",
              email: "juanpabloarce@felc.com",
              password:               "jparce",
              password_confirmation:  "jparce",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Pato Chapa",
              email: "patochapa@felc.com",
              password:               "pchapa",
              password_confirmation:  "pchapa",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Pato Valerio",
              email: "patovalerio@felc.com",
              password:               "pvalerio",
              password_confirmation:  "pvalerio",
              company_account_id: 7,
              balance: 0,
              admin: true)
User.create!( name: "Rafa Garza",
              email: "rafagarza@felc.com",
              password:               "rgarza",
              password_confirmation:  "rgarza",
              company_account_id: 7,
              balance: 0,
              admin: true)
#
# 20.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!( name: name,
#                 email: email,
#                 balance: 1500,
#                 password:               password,
#                 password_confirmation:  password )
# end


#Properites

Property.create!( name: "Bebederos",
                  price: 450,
                  bought_at: 450,
                  company_account_id: 7 )
Property.create!( name: "Bancas",
                  price: 500,
                  bought_at: 500,
                  company_account_id: 7)
Property.create!( name: "Curvita",
                  price: 250,
                  bought_at: 250,
                  company_account_id: 7)
Property.create!( name: "Asta Bandera",
                  price: 350,
                  bought_at: 350,
                  company_account_id: 7 )
Property.create!( name: "Cybercafe",
                  price: 250,
                  bought_at: 250,
                  company_account_id: 7)
Property.create!( name: "Area Verde",
                  price: 500,
                  bought_at: 500,
                  company_account_id: 7)
Property.create!( name: "Patio Trasero",
                  price: 300,
                  bought_at: 300,
                  company_account_id: 7)
Property.create!( name: "Under the Tree",
                  price: 200,
                  bought_at: 200,
                  company_account_id: 7)
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
