class DiaryScreenshot < ActiveRecord::Base
  belongs_to :diary_day

  mount_uploader :file, DiaryScreenshotUploader
end
