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

class Answer < ActiveRecord::Base
  include Concerns::AsJson

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_create :increment_position

  belongs_to :question

  def image_url
    if image && image.url
      URI.join(ActionController::Base.asset_host, image.url(:medium)).to_s
    end
  end

  private

  def increment_position
    #self.position = question.present? ? question.answers.size : 0
  end

  def only_attributes
    %w(id position question_id)
  end

  def methods_list
    %w(image_url)
  end
end
