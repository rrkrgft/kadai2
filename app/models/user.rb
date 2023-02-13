class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :password, length: { minimum: 6 }

  before_validation { email.downcase! }
  #モデルにアドレスを小文字にする処理を入れる
  has_secure_password
  #パスワードをハッシュ化する。事前にgem bcryptを追加

end
