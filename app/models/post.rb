# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  belongs_to :board
  validates :body, presence: true

  def has_expired?
    bool = false
    expired = expires_on.to_time
    if self.expires_on < Time.now
      bool = true
    end
    return bool
  end

end
