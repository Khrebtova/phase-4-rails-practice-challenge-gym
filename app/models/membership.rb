class Membership < ApplicationRecord
  
  validates :client_id, presence: true
  validates :gym_id, presence: true
  validates :charge, presence: true, numericality: { greater_than: 0 }
  
  belongs_to :client
  belongs_to :gym

  
end
