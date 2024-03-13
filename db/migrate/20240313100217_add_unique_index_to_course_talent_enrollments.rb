class AddUniqueIndexToCourseTalentEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_index :course_talent_enrollments, [:course_id, :talent_id, :talent_learning_path_enrollment_id], name: 'unique_course_talent_enrollment',unique: true

  end
end
