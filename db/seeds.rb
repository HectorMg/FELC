# Company Accounts (9)
CompanyAccount.create!( name: "Food 1",
                       market: "Food",
                       numerator: 1,
                       balance: 1500)
CompanyAccount.create!( name: "Food 2",
                       market: "Food",
                       numerator: 2,
                       balance: 1500)
CompanyAccount.create!( name: "Entertainment 1",
                       market: "Entertainment",
                       numerator: 1,
                       balance: 1500)
CompanyAccount.create!( name: "Entertainment 2",
                       market: "Entertainment",
                       numerator: 2,
                       balance: 1500)
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
             company_account_id: 9,
             admin: true)
#17.times do |n|
  #name = "BankStaff#{n}"
  #email = "bankstaff#{n}@felc.com"
  #password = "bankstaff#{n}"
  #User.create!( name: name,
                #email: email,
                #password: password,
                #password_confirmation: password,
                #balance: 0,
                #company_account_id: 9,
                #admin: false)
#end

 #20.times do |n|
   #name = Faker::Name.name
   #email = "example-#{n+1}@railstutorial.org"
   #password = "password"
   #User.create!( name: name,
                 #email: email,
                 #balance: 20-n,
                 #password:               password,
                 #password_confirmation:  password,
                 #company_account_id: 1)
 #end


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
