class PopulatePostCommentsCount < ActiveRecord::Migration[6.0]
  def up
    Post.all.each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
