class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carbon_footprints, dependent: :destroy
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?


  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
