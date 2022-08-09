class Tag < ApplicationRecord
  has_many :park_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :parks, through: :park_tags
end
