class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.string :day
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
