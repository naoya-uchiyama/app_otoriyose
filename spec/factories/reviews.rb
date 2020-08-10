FactoryBot.define do
  
  factory :review do
    id               {"1"}
    title            {"テスト"}
    content          {"テスト"}
    image            {"images__1_.jpeg"}
    user_id          {"1"}
    item_id          {"1"}
  end
end