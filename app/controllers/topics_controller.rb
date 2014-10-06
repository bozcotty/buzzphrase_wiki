class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize! :create, Topic, message: "You need to be signed in to do that."
  end

  def create
    @topic = current_user.topics.new(topic_params)
    authorize! :create, @topic, message: "You need to be signed in to do that."
    if @topic.save
      @topic.users << current_user
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    authorize! :read, @topic, message: "You need to be signed in to do that."
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :edit, @topic, message: "You need to be signed in to do that."
  end

  def update
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to be signed in to do that."
    if @topic.update(topic_params)
      @topic.users << current_user
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
