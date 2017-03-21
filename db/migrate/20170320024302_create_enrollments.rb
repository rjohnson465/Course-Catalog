class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.integer :user
      t.integer :courses

      t.timestamps
    end
  end
end
