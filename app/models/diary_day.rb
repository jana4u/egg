class DiaryDay < ActiveRecord::Base
  belongs_to :character
  has_many :diary_screenshots, :dependent => :destroy

  attr_protected :character_id, :points

  validates :diary_date, :presence => true, :uniqueness => { :scope => :character_id }
  validates :character, :presence => true
  validate :validates_diary_screenshots_count

  before_save :assign_week_number

  accepts_nested_attributes_for :diary_screenshots, :reject_if => :all_blank,
    :allow_destroy => true

  def images=(uploaded_images)
    image_params = []

    uploaded_images.each do |img|
      image_params << { :file => img }
    end

    self.diary_screenshots_attributes = image_params
  end

  def diary_screenshots_count
    diary_screenshots.size - diary_screenshots.select { |diary_screenshot| diary_screenshot.marked_for_destruction? }.size - diary_screenshots.select { |diary_screenshot| diary_screenshot.new_record? && diary_screenshot.invalid? }.size
  end

  private

  def validates_diary_screenshots_count
    errors.add(:diary_screenshots_count, :less_than_or_equal_to, :count => 5) if diary_screenshots_count > 5
  end

  def assign_week_number
    self.week_number = diary_date.cweek
  end
end
