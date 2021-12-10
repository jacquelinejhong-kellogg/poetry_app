class PoetsController < ApplicationController
  before_action :set_poet, only: [:show, :edit, :update, :destroy]

  # GET /poets
  def index
    @poets = Poet.page(params[:page]).per(10)
  end

  # GET /poets/1
  def show
    @friend_request = FriendRequest.new
    @like = Like.new
    @comment = Comment.new
    @poem = Poem.new
  end

  # GET /poets/new
  def new
    @poet = Poet.new
  end

  # GET /poets/1/edit
  def edit
  end

  # POST /poets
  def create
    @poet = Poet.new(poet_params)

    if @poet.save
      redirect_to @poet, notice: 'Poet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /poets/1
  def update
    if @poet.update(poet_params)
      redirect_to @poet, notice: 'Poet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /poets/1
  def destroy
    @poet.destroy
    redirect_to poets_url, notice: 'Poet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poet
      @poet = Poet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poet_params
      params.require(:poet).permit(:email, :password, :name, :bio, :dob, :photo)
    end
end
