class Book < ApplicationRecord
    validates :title, :author, :summery, presence: true
end
