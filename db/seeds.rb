include ActionView::Helpers
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(email: 'test@echo.com', password: 'echo1234', password_confirmation: 'echo1234')

user = User.first
lists = [{q: 'Are you happy?', a: [{desc: 'Yes', image: File.new("#{Rails.root}/app/assets#{image_path('yes.png')}")}, {desc: 'No', image: "#{Rails.root}/app/assets#{image_path('no.png')}"}]}]
lists.each do |list|
  q = Question.create(description: list[:q])
  user.questions << q
  list[:a].each do |ans|
    answer = Answer.create(description: ans[:desc], image: ans[:image])
    q.answers << answer
  end
end
