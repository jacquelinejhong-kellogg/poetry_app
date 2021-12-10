class PoetsController < ApplicationController
  before_action :set_poet, only: %i[show edit update destroy]

  def index
    @q = Poet.ransack(params[:q])
    @poets = @q.result(distinct: true).includes(:poems, :comments, :likes,
                                                :sent_friend_requests, :received_friend_requests, :recipients, :senders, :liked_poems).page(params[:page]).per(10)
  end

  def show
    @friend_request = FriendRequest.new
    @like = Like.new
    @comment = Comment.new
    @poem = Poem.new
  end

  def new
    @poet = Poet.new
  end

  def edit; end

  def create
    @poet = Poet.new(poet_params)

    if @poet.save
      redirect_to @poet, notice: "Poet was successfully created."
    else
      render :new
    end
  end

  def update
    if @poet.update(poet_params)
      redirect_to @poet, notice: "Poet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @poet.destroy
    redirect_to poets_url, notice: "Poet was successfully destroyed."
  end

  private

  def set_poet
    @poet = Poet.find(params[:id])
  end

  def poet_params
    params.require(:poet).permit(:email, :password, :name, :bio, :dob, :photo)
  end
end
