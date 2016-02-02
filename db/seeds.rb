User.create!( name: "Example User",
              email: "example@railstutorial.org",
              password:               "foobar",
              password_confirmation:  "foobar",
              admin: true)
User.create!( name: "Hector Morales",
              email: "hectormgwake@gmail.com",
              password:               "foobar",
              password_confirmation:  "foobar",
              company_account_id: 1,
              admin: false)
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!( name: name,
                email: email,
                password:               password,
                password_confirmation:  password, )
end

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
