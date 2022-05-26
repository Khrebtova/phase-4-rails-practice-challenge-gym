class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :charge
  belongs_to :client
  belongs_to :gym
end
