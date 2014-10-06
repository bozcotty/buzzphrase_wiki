class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize! :create, Topic, message: "You need to be signed in to do that."
  end

  def create
    @topic = Topic.new(params[:topic])
    authorize! :create, @topic, message: "You need to be signed in to do that."
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    authorize! :read, @topic, message: "You need to be signedn in to do that."
    # @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :edit, @topic, message: "You need to be signed in to do that."

  end

  def update
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to be signed in to do that."
    if @topic.update(params[:topic])
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end
end
