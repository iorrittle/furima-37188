FactoryBot.define do
  factory :user do
    nickname              {Faker: :name.initials(number: 2)}
    email                 {Faker: :internet.free_email}
    password              {Faker: :internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {''}
    first_name            {''}
  end
end