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
lists = [{q: 'Are you happy?', a: ['Yes', 'No']}]
lists.each do |list|
  q = Question.where(description: list[:q]).first_or_create
  user.questions << q
  list[:a].each do |ans|
    answer = Answer.where(description: ans).first_or_create
    q.answers << answer
  end
end
