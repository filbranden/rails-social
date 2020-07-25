class User < ApplicationRecord
  has_many :subscriptions, foreign_key: :follower_id,
                           dependent: :destroy
  has_many :leaders, through: :subscriptions
end
