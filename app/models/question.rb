# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ActiveRecord::Base
  include Concerns::AsJson

  belongs_to :user
  has_many :answers

  private

  def only_attributes
    %w(id description user_id)
  end
end
