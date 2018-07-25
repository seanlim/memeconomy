class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    @post.description = permit_post_update[:description]
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end	

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Success!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  private
  	def permit_post
  		params.require(:post).permit(:image, :description, :user_id)
  	end

  private
    def permit_post_update
      params.require(:post).permit(:description)
    end
end