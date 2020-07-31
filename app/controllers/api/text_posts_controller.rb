module Api
  class TextPostsController < ApplicationController
    before_action :authenticate_token!

    def create
      @text_post = @api_user.text_posts.create(text_post_params)
      render json: @text_post
    end

    private

    def text_post_params
      params.require(:text_post).permit(:title, :body)
    end
  end
end
