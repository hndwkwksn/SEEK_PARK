class Park < ApplicationRecord
  belongs_to :end_user
  has_one_attached :image

  validates :name,presence:true,length:{maximum:50}
  validates :introduction,length:{maximum:200}
  validates :address,presence:true,length:{maximum:100}

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
