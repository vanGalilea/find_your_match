class DeleteStudentsABandDateFromMatches < ActiveRecord::Migration[5.1]
  def change
      remove_column :matches, :student_a
      remove_column :matches, :student_b
      remove_column :matches, :date
  end
end
