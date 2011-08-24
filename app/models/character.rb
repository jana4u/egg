class Character < ActiveRecord::Base
  belongs_to :user
  has_many :diary_days

  attr_protected :user_id

  validates :name, :presence => true, :uniqueness => true
  validates :user, :presence => true
end
