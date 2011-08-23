class Character < ActiveRecord::Base
  belongs_to :user
  has_many :diary_days

  validates :name, :presence => true, :uniqueness => true
end
