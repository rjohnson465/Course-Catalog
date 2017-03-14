class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :given_id
      t.string :code
      t.string :subjects
      t.string :name
      t.string :description
      t.integer :credits

      t.timestamps
    end
  end
end
