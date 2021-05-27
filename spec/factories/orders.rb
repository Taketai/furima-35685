FactoryBot.define do
  factory :order do
    postal_code      {'123-4567'}
    shipping_area_id {'2'}
    city_name        {'札幌市'}
    block_name       {'1-2-3'}
    building_name    {'久志産業'}
    phone_number     {'08012345678'}
    association :user        
    association :item       
  end
end