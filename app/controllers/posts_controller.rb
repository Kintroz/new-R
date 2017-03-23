class PostsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create]
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new (post_params)
        @post.user = current_user
        if @post.save!
            redirect_to @post
        else
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update post_params
        if @post.save!
            redirect_to @post
        else
            render :edit
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id]) 
        @comment = Comment.new
    end
    
    def comment
        @post = Post.find(params[:id])
        @comment = @post.comments.new comment_params
        @comment.user = current_user
        @comment.save!
        redirect_to @post
    end
    
    private
    
    def post_params
       params.require(:post).permit(:title, :body, :published)
    end
    
    def comment_params
       params.require(:comment).permit(:title, :body, :published)
    end

end