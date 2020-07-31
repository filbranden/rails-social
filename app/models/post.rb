class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :type, presence: true

  def as_json(options={})
    super(except: [:user_id], include: :user)
  end
end
