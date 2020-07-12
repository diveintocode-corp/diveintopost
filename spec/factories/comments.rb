FactoryBot.define do
  factory :comment do
    article nil
    content { "MyText" }
  end
end
