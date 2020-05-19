class Tagging < ApplicationRecord
  belongs_to :book
  belongs_to :tag
end
