class DiaryDay < ActiveRecord::Base
  belongs_to :character
  has_many :diary_screenshots

  attr_protected :character_id, :points

  validates :diary_date, :presence => true, :uniqueness => { :scope => :character_id }

  before_save :assign_week_number

  accepts_nested_attributes_for :diary_screenshots, :reject_if => :all_blank,
    :allow_destroy => true, :limit => 5

  private

  def assign_week_number
    self.week_number = diary_date.cweek
  end
end
