class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lesson_id
      t.integer :word_id
      t.integer :option_id

      t.timestamps
    end
  end
end
