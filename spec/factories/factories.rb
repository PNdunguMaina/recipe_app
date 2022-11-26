FactoryBot.define do
  factory :user do
    email { 't@t.t' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
