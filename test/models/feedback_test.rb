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

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
