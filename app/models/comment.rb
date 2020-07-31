class Comment < ApplicationRecord
  belongs_to :post, touch: true, counter_cache: true
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true
end
