class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :seat
  belongs_to :show


  def self.ransackable_associations(auth_object = nil)
    ["seat", "show", "user"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "seat_id", "show_id", "total", "updated_at", "user_id"]
  end 
end
