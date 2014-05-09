(1..10).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '0')
end

(1..3).each do |i| 
  User.create(name: "Admin#{i}", email: "admin#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '1')
end

(1..3).each do |i| 
  Category.create(name: "Category#{i}", description: "can choose a course he learns from some courses.")
  (1..22).each do |j| 
    Word.create(word: "word#{j}", meaning: "this is rails app", category_id: i)
    (1..4).each do |k| 
      Option.create(word_id: j, answer: "mean #{k}", correct: false)
    end
  end
end

(1..10).each do |i| 
  Lesson.create(user_id: i, category_id: i, count_correct: 3)
  Result.create(lesson_id: 1, word_id: i)
end