module Api
  class TextPostsController < ApplicationController
    before_action :authenticate_token!

    def create
      @text_post = @api_user.text_posts.build(text_post_params)
      if @text_post.save
        render json: @text_post, status: :created
      else
        render json: {errors: @text_post.errors}, status: 422
      end
    end

    private

    def text_post_params
      params.require(:text_post).permit(:title, :body)
    end
  end
end
