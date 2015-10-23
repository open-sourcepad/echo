# == Schema Information
#
# Table name: answers
#
#  id                 :integer          not null, primary key
#  description        :text             default(""), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  position           :integer          default(1), not null
#  question_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
