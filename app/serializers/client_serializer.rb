class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :memberships_count

  has_many :memberships

  def memberships_count
    self.object.memberships.count
  end
end
