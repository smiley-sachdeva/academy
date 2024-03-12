class AddUniqueIndexToCoursesLearningPaths < ActiveRecord::Migration[6.0]
  def change
    add_index :course_learning_paths, [:course_id, :learning_path_id], unique: true
    add_index :course_learning_paths, [:course_id, :learning_path_id, :sequence], name: 'unique_sequence',unique: true
  end
end
