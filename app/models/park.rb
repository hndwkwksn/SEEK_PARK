class Park < ApplicationRecord
  belongs_to :end_user
  has_many :park_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :park_tags, dependent: :destroy
  has_many :tags, through: :park_tags

  has_one_attached :image

  # 入力した住所から緯度経度を保存
  geocoded_by :address
  # 後に住所変更があっても、変更後の緯度経度を保存してくれる
  after_validation :geocode, if: :address_changed?

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

  # タグ保存機能
  def save_tags(savepark_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - savepark_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = savepark_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      park_tag = Tag.find_or_create_by(name:new_name)
      # 配列に保存
      self.tags << park_tag
    end
  end

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか。　存在していればtrue、存在していなければfalse
  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
