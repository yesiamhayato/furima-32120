class Order < ApplicationRecord
  attr_accessor :token
  
  validates :token, presence: true

  belongs_to :item
  belongs_to :user
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipped_from
end
