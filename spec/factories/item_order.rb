FactoryBot.define do
  factory :item_order do
    postal_code      {'123-4567'}
    shipping_area_id {2}
    city_name        {'旭川市'}
    block_name       {'1-1-1'}
    building_name    {'たけラボ'}
    phone_number     {'09012345678'} 
    token {"tok_abcdefghijk00000000000000000"}
    item_id{'3'}
    user_id{'2'}
  end
end
