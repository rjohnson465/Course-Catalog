class ChangeEnrollmentsCoursesToString < ActiveRecord::Migration[5.0]
  def change
    change_column(:enrollments, :courses, :string)
  end
end
