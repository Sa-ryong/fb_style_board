# encoding: UTF-8
class BrowseController < ApplicationController
  before_filter :update_post_streams, only: [:home, :refresh_posts]

  def home
  end

  def profile
  end

  def message
  end

  def about
  end

  def vote_up
    @post = Post.find params[:id]
    @post.like += 1
    @post.save

    render text: "<div class='up'></div> #{@post.like.to_s} 좋아요"
  end

  def vote_down
    @post = Post.find params[:id]
    @post.dislike += 1
    @post.save

    render text: "<div class='down'></div> #{@post.dislike.to_s} 싫어요"
  end

  def refresh_posts
    render partial: 'posts.html.erb', locals: { posts_streams: @posts_streams }
  end


  private

  def update_post_streams
    @posts_streams = Post.order('created_at DESC').all
  end
end
