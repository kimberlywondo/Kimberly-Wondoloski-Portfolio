class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]
  #This authenticates admin whenever a post is to be created, updated or destroyed.
  before_action :authenticate_admin!, except: [:index, :show]

 # Render all posts
 def index
   @posts = Post.all
 end

 # Create a post
 def new
   @post = Post.new
 end

 # Save a created post to DB
 def create
   @post = Post.new(post_params)
   if @post.save
     flash[:notice] = "Successfully created post!"
     redirect_to posts_path(@post)
   else
     flash[:alert] = "Error creating new post!"
     render :new
   end
 end

 # Retrieve a saved post and render edit page
 def edit

 end

 # Update the retrieved post with edits
 def update
   @post = Post.find(params[:id])
   if @post.update_attributes(post_params)
     flash[:notice] = "Successfully updated post!"
     redirect_to post_path(@post)
   else
     flash[:alert] = "Error updating post!"
     render :edit
   end
 end

 # Render a single post by ID
 def show
 end

 # Remove a single post from DB
 def destroy
   @post = Post.find(params[:id])
   if @post.destroy
     flash[:notice] = "Successfully deleted post!"
     redirect_to posts_path
   else
     flash[:alert] = "Error updating post!"
   end
 end

 private

 def post_params
   params.require(:post).permit(:title, :body)
 end

 def find_post
   @post = Post.find(params[:id])
 end
end
