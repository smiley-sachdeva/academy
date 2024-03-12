class CreateCourseTalentEnrollmentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :course_talent_enrollments do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :talent, foreign_key: true

      t.string :status

      t.timestamps
    end
  end
end
