class Theatre < ApplicationRecord
    has_and_belongs_to_many :movies
    has_many :shows, dependent: :destroy
    has_many :seats
    

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "location", "name", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["movies"]
      end

      # This code solve the error of active_admin if association is created...
      def self.ransackable_associations(auth_object = nil)
        ["shows"]
      end
end
    