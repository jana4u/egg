class CreateDiaryDays < ActiveRecord::Migration
  def self.up
    create_table :diary_days do |t|
      t.references :character
      t.date :diary_date
      t.integer :week_number
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :diary_days
  end
end
