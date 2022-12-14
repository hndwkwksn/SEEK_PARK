class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parks, dependent: :destroy
  has_many :park_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォロー一覧画面で使う
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :user_rooms

  has_one_attached :profile_image

  validates :name,presence:true,length:{maximum:50}

  # 画像サイズの変更をする為　※'resize_to_limit'は元の画像サイズより大きくすることは出来ない！
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローしたときの処理
  def follow(end_user)
    relationships.create(followed_id: end_user.id)
  end
  # フォローを外すときの処理
  def unfollow(end_user)
    relationships.find_by(followed_id: end_user.id).destroy
  end
  # フォローしているか判定
  def following?(end_user)
    followings.include?(end_user)
  end

  # ゲストログイン機能
  def self.guest
    # find_or_create_byは、データの検索と作成を自動的に判断して処理を行うメソッド。「!」を付与することで、処理がうまくいかなかった場合にエラーが発生するようになり、不具合を検知しやすくなります。
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64  #ランダムな文字列を生成するRubyのメソッド
      end_user.name = "guestuser"
    end
  end

  def guest?
    name === "guestuser"
  end
end
