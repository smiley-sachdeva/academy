class Course < ApplicationRecord
  has_many :course_authors, dependent: :destroy
  has_many :authors, through: :course_authors, source: :author

  validates :authors,presence: true, on: :create
end
