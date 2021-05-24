FactoryBot.define do
  factory :item do
    product_name           { 'たけのかお' }
    description            { '嫁が描いた１０秒似顔絵' }
    category_id            { 2 }
    judgement_id           { 2 }
    shipping_cost_id       { 2 }
    shipping_area_id       { 2 }
    shipping_days_id       { 2 }
    price                  { 10000 }

    association :user
  end
end