class Movie < ApplicationRecord
    # has_one_attached :image
    has_and_belongs_to_many :theatres
    def self.ransackable_associations(auth_object = nil)
        ["theatres"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "duration", "genre", "id", "id_value", "release_date", "title", "updated_at"]
    end
end
