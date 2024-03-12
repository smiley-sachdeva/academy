class CreateCoursesLearningPathsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :course_learning_paths do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :learning_path, foreign_key: true

      t.integer :sequence

      t.timestamps      
    end
  end
end
