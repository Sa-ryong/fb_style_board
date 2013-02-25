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
    post = Post.find params[:id]
    unless current_user.like? post
      like = current_user.like! post
      if like
        Post.increment_counter :like, post.id
        render text: "#{post.like+1} #{t 'like.add'}"
      end
    else
      render text: "#{post.like} #{t 'like.add'}"
    end
  end

  def vote_down
    post = Post.find params[:id]
    Post.increment_counter :dislike, post.id

    render text: "#{post.dislike+1} #{t 'dislike.add'}"
  end

  def refresh_posts
    render partial: 'posts', locals: { posts_streams: @posts_streams }
  end


  private

  def update_post_streams
    @posts_streams = Post.order('created_at DESC').all
  end
end
