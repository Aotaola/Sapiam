class Collection < ApplicationRecord
    has_many :user_collections
    has_many :users, through: :user_collections
    has_many :collection_sources
    has_many :sources, through: :collection_sources
    has_one :forum

    validates :title, presence: true, length: {minimum: 5, maximum: 80}
    validates :description, length: {minimum: 5}
    
    attr_accessor :user_id

    after_create :create_user_collection
    after_create :create_forum!

    def create_user_collection
        UserCollection.create!(collection_id: self.id, user_id: self.user_id)
    end

    def self.ransackable_associations(auth_object = nil)
        ['sources', 'forum', 'users']
    end
    def self.ransackable_attributes(auth_object = nil)
        ["title"]
    end
    
end
