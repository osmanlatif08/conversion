class CreateStudentResults < ActiveRecord::Migration[6.1]
  def change
    create_table :student_results do |t|
      t.integer :student_id
      t.integer :uploaded_by
      t.integer :conversion_type
      
      t.float :input_value
      t.float :output_value
      t.float :student_response

      t.string :input_measure_unit
      t.string :target_measure_unit
      
      t.timestamps
    end
  end
end
