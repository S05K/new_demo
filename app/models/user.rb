class User < ApplicationRecord
    has_secure_password

    has_many :payments
    validates :user_email, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "password_digest", "updated_at", "user_email", "user_name", "user_number","stripe_customer_id"]
      end
      def self.ransackable_associations(auth_object = nil)
        ["payments"]
      end
end
