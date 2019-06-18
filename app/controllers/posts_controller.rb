class PostsController < ApplicationController
    def index
      @posts = Post.all.order(created_at: "DESC")
    end

    def new
      @post = Post.new
    end

    def show
      @post = Post.find(params[:id])
      @post_comment = PostComment.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to posts_path
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to posts_path
    end

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
