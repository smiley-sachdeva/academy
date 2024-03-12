json.extract! learning_path, :id, :name, :created_at, :updated_at
json.courses learning_path.courses do |course|
    json.id course.id
    json.name course.name
    json.sequence course.course_learning_paths.find_by(learning_path_id: learning_path.id).sequence
end
json.url learning_path_url(learning_path, format: :json)
