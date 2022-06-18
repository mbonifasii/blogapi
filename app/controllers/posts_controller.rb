class PostsController < ApplicationZoeController
    before_action :set_post, only: [:show]

    def index
        @posts = Post.where(:published => true)
        render json: @posts, status: :ok
    end

    def show
        render json: @post, status: :ok
    end

    def create
        post = Post.new(post_params)

        if post.save
            respond_with_successful(post)
            # render json: { successful: true, payload: { post: post } }, status: :created
        else
            render json: { error: post.errors.full_messages.to_sentence }, status: :bad_request 
        end
    end

    private

    def set_post
        @post = Post.find_by_id(params[:id])
    end

    def post_params
        params.fetch(:post, {}).permit(:title, :content, :published, :user_id)
    end
end
