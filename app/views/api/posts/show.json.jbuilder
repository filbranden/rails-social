json.extract! @post, :id, :title, :body, :url
json.user do
  json.extract! @post.user, :id, :name, :email
end
json.comments do
  json.array! @post.comments do |comment|
    json.extract! comment, :id, :body
    json.user do
      json.extract! comment.user, :id, :name, :email
    end
  end
end
