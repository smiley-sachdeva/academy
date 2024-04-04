class AddUniqueIndexToTalentLearningPath < ActiveRecord::Migration[6.0]
  def change
    add_index :talent_learning_path_enrollments, [:learning_path_id, :talent_id, :status], name: 'unique_learning_path_enrollment', unique: true
  end
end
