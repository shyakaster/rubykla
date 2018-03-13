# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  author_id        :integer
#  banner_image_url :string
#  slug             :string
#  created_at       :datetime
#  updated_at       :datetime
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord
   # before_save :set_publish_val

  extend FriendlyId

  friendly_id :title, use: :slugged

   belongs_to :author

  scope :most_recent, -> { order(published_at: :desc)}
  scope :published, -> { where(published: true)}



  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at.present?
     "Published: #{published_at.strftime('%-b %-d %Y')}"
    else
     "Not yet published"
    end
  end

  # def set_publish_val
  #   self.published_at = Time.now
  # end

  def publish
    update(published: true,published_at: Time.now)
  end
  def unpublish
    update(published: false,published_at: nil)
  end
end
