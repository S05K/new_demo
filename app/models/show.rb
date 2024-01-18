class Show < ApplicationRecord
  belongs_to :theatre
  has_many :seats
  has_many :payments
  def self.ransackable_associations(auth_object = nil)
    ["theatre", "seats","payments"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "id", "id_value", "theatre_id", "time", "updated_at", "price"]
  end
end
