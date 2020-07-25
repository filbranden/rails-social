class Subscription < ApplicationRecord
  belongs_to :leader
  belongs_to :follower
end
