class Park < ApplicationRecord
  belongs_to :end_user
  has_many :park_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :name,presence:true,length:{maximum:50}
  validates :introduction,length:{maximum:200}
  validates :address,presence:true,length:{maximum:100}

  # 画像サイズの変更をする為　※'resize_to_limit'は元の画像サイズより大きくすることは出来ない！
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか。　存在していればtrue、存在していなければfalse
  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
