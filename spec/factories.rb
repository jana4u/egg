Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password 'secret'
  f.password_confirmation 'secret'
  f.answer 'Cruchy'
end

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :character do |f|
  f.name { Factory.next(:character_name) }
end

Factory.sequence :character_name do |n|
  "Name#{n}"
end
