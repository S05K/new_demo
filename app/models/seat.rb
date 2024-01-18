class Seat < ApplicationRecord
  belongs_to :show
  belongs_to :theatre
  has_many :payments
  def self.ransackable_associations(auth_object = nil)
    ["show", "theatre","payments"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "number", "row", "show_id", "theatre_id", "payment_id","updated_at"]
  end


end
