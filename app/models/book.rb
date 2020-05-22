class Book < ApplicationRecord
has_many :taggings, dependent: :destroy
has_many :tags, through: :taggings
has_many :likes, dependent: :destroy
belongs_to :user
validates :user_id, presence: true
validates :title, :author, :summery, presence: true
def all_tags
    self.tags.map(&:name).join(', ')
end
def all_tags=(names)
    self.tags= names.split(', ').map do |name|
        if( name[0] == "#")
            name = name[1..-1]
        end
        Tag.where(name: name.strip.prepend("#")).first_or_create!
    end
end
end
