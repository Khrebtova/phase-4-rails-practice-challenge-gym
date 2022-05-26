class Gym < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true

    has_many :memberships
    has_many :clients, through: :memberships
end
