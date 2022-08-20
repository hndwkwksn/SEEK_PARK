class Tag < ApplicationRecord
  has_many :park_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :parks, through: :park_tags

  scope :merge_parks, -> (tags){ }

  def self.search_parks_for(content)
    tags = Tag.where(name: content)
    return tags.inject(init = []) {|result, tag| result + tag.parks}
  end
end
