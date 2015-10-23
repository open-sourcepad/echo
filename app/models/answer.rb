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
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :question

  def image_url
    if image && image.url
      image.url(:medium)
    end
  end

  private

  def only_attributes
    %w(id position question_id)
  end

  def methods_list
    %w(image_url)
  end
end
