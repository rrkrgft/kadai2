class User < ApplicationRecord
  validates :name, presence: true, length: { maximam: 30 }
  validates :email, presence: true, length: { maximam: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true

  before_validation { email.downcase! }
  #モデルにアドレスを小文字にする処理を入れる
end
