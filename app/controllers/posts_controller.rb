class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
        @post.categories.build
    end

    def create
        post = Post.new(post_params)
        if post.valid?
            post.save
            redirect_to post_path(post)
        else
            render :new 
        end
    end

    def edit
    end

    def update
    end
    
    def destroy
    end

    private

    def set_post 
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, category_ids: [], categories_attributes: [:name])
    end

end
