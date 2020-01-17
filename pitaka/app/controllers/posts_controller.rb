# frozen_string_literal: true

# actions related with Posts
class PostsController < ApplicationController
  # before_action will be triggered only before show, edit, update, destroy
  before_action :find_post, only: %i[show edit update destroy]

  # list posts
  def index
    # all posts
    @posts = Post.all
    render 'index.json'
  end

  # show one post
  # 'before_action' filter will find the post with ':id'
  def show
    render 'show.json'
  end

  def new
    @post = Post.new
  end

  # create a new post
  def create
    # 'new' initializes a new instance of the model
    @post = Post.new(post_params) # 'post_params' supplies params from frontend

    if @post.save # if the object get saved
      redirect_to @post, notice: 'The new post was created.'
    else
      render 'new'
    end
  end

  # 'before_action' filter will find the post with ':id'
  def edit; end

  # edit a post
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'The post was updated.'
    else
      render 'edit'
    end
  end

  # delete a post
  def destroy
    @post.destroy
    redirect_to root_path, notice: 'The post was deleted.'
  end

  private

  # require specified params
  def post_params
    params.require(:post).permit(:title, :subtitle, :content)
  end

  # extract blog id from params
  def find_post
    # @post is an instance variable (not local variable) which is available in 'views'
    @post = Post.find(params[:id])
  end
end