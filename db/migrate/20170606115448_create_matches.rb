class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :student_a
      t.integer :student_b
      t.datetime :date
      t.integer :total_matches

      t.timestamps
    end
  end
end
