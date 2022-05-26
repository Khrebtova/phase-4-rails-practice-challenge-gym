class Membership < ApplicationRecord
  
  validates :client_id, presence: true
  validates :gym_id, presence: true
  validates :charge, presence: true, numericality: { greater_than: 0 }
  
  validate :client_is_not_already_in_gym

  belongs_to :client
  belongs_to :gym

  
  def client_is_not_already_in_gym 
   
    if Membership.where(client_id: client_id, gym_id: gym_id).exists?  
      errors.add(:client_id, "is already in this gym")
    end
  end
  
end
