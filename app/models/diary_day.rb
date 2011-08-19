class DiaryDay < ActiveRecord::Base
  belongs_to :character
  has_many :diary_screenshots

  accepts_nested_attributes_for :diary_screenshots, :reject_if => :all_blank,
    :allow_destroy => true, :limit => 5
end
