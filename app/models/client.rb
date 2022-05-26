class Client < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    
    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships
end
