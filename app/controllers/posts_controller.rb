class PostsController < ApplicationController

  def index
    # find all Post rows
    @posts = Post.all
    # render posts/index view
  end

  def new
    # render posts/new view with new Post form
  end

  def create
  #   # start with a new Post
  @posts = Post.new
  #   # assign user-entered form data to Post's columns
  @posts["author"] = params["author"]
  @posts["body"] = params["body"]
  @posts["image"] = params["image"]
  #   # save Post row
  @posts.save
  #   # redirect user
  redirect_to "/posts"
  end

end
