# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean          default(FALSE)
#

class Question < ActiveRecord::Base
  include Concerns::AsJson

  belongs_to :user
  has_many :feedbacks
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  scope :active, -> {where(active: true)}

  def set_active
    self.active = true
    self.save
  end

  def last_response
    feedbacks.any? ? feedbacks.order('created_at desc').first.created_at.strftime('%B %d, %Y') : nil
  end

  def feedback_count
    feedbacks.count
  end

  private

  def only_attributes
    %w(id description user_id)
  end
end
