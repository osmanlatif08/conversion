# == Schema Information
#
# Table name: student_results
#
#  id                  :bigint           not null, primary key
#  conversion_type     :integer
#  input_measure_unit  :string
#  input_value         :float
#  output_value        :float
#  student_response    :float
#  target_measure_unit :string
#  uploaded_by         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  student_id          :integer
#
class StudentResult < ApplicationRecord
    belongs_to :student, class_name: "User", foreign_key: "student_id"
    belongs_to :teacher, class_name: "User", foreign_key: "uploaded_by"

    enum conversion_type: [ :temprature, :volume ]

    def self.import(file)
        data = Roo::Spreadsheet.open(file)
        headers = data.row(1)
        headers = headers.collect(&:strip).collect(&:downcase).map{|e| e.gsub(/ +/, " ").gsub(" ","_")}
        data.each_with_index do |row, idx|
          next if idx == 0
          student_result_data = Hash[[headers, row].transpose]
        #   next unless student_result_data['conversion_type'].present? && student_result_data['input_measure_unit'].present?
          student_result = self.new(student_result_data)
          student_.save!
        end
    end
end
