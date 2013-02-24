class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').all
    respond_to do |f|
      f.html
      f.json { render json: @posts }
    end
  end

  def show
    @post = Post.find params[:id]
    respond_to do |f|
      f.html
      f.json { render json: @post }
    end
  end

  def new
    @post = current_user.posts.new
  end

  def create
    writer = current_user
    @post = writer.posts.new params[:post]
    @post.writer = writer.name
    @post.like = 0
    @post.dislike = 0

    respond_to do |f|
      if @post.save
        f.html { redirect_to root_path }
        f.json { render json: @post, status: :created, location: @post }
      else
        f.html { redirect_to root_path }
        f.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    respond_to do |f|
      if @post.update_attributes params[:post]
        f.html { redirect_to @post, notice: t(:post_updated) }
        f.json { head :no_content }
      else
        f.html { render :edit }
        f.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    respond_to do |f|
      f.html { redirect_to posts_url }
      f.json { head :no_content }
    end
  end
end