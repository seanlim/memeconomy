class PostsController < ApplicationController
  
  before_action :authenticate_user!
  def new
  	@post = Post.new
    @comment = Comment.new
  end

  def update
    @post = Post.find(params[:id])
    @post.description = permit_post_update[:description]
    @post.category = permit_post_update[:category]
    if @post.save
      flash[:error] = "Post updated successfully!"
      redirect_to post_path(@post)
    else
      flash[:error] = "Could not update meme :/ Please try again."
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end     

  def index
  	@posts = Post.all
    @posts = @posts.order('created_at DESC')
    @comment = Comment.new
    @comments = Comment.all
  end

  def show
  	@post = Post.find(params[:id])
  end	

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Success! New post created."
  		redirect_to post_path(@post)
    else
  		flash[:error] = "Could not create meme :/ Please try again."
  		redirect_to new_post_path
  	end
    
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post successfully deleted."
      redirect_to posts_path
    else
      flash[:error] = "Could not delete meme :/ Please try again."
      redirect_to post_path(@post)
    end
  end

  private
  	def permit_post
  		params.require(:post).permit(:image, :description, :category, :user_id)
  	end

  private
    def permit_post_update
      params.require(:post).permit(:description, :category)
    end
end