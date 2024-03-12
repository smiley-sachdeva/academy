class AddTalentLearningPathIdToCourseTalentEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_reference :course_talent_enrollments, :talent_learning_path_enrollment, index: {name: 'course_talents'},null: false, foreign_key: true  
  end
end
