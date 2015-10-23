# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  answer_id   :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Feedback < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
end
