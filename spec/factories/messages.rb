FactoryBot.define do
  factory :message do
    report { "123" }
    password { "aaa" }
    lifetime { 3 }
  end
end
