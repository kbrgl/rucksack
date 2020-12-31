class Writer < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    unless self.roles.blank?
      return
    end

    if Writer.all.count > 1
      self.add_role(:stranger)
    else
      self.add_role(:friend)
    end
  end
end
