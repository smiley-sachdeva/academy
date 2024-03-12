class CreateTalentLearningPathEnrollmentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :talent_learning_path_enrollments do |t|
      t.belongs_to :learning_path, foreign_key: true
      t.belongs_to :talent, foreign_key: true

      t.string :status

      t.timestamps
    end
  end
end
