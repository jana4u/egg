class CreateDiaryScreenshots < ActiveRecord::Migration
  def self.up
    create_table :diary_screenshots do |t|
      t.references :diary_day
      t.string :file

      t.timestamps
    end
  end

  def self.down
    drop_table :diary_screenshots
  end
end
