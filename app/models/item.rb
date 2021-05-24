  
class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :judgement
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :product_name, :description, :image
    
    with_options numericality: { other_than: 1 } do
      validates :category_id, :judgement_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id
    end
    
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    end

  end
end