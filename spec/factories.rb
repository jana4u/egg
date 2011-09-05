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
  f.association :user
end

Factory.sequence :character_name do |n|
  "Name#{n}"
end

Factory.define :diary_day do |f|
  f.diary_date { Factory.next(:diary_date) }
  f.association :character
end

Factory.sequence :diary_date do |n|
  n.days.ago.to_date
end
