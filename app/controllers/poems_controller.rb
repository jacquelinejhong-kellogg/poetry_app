class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems
  def index
    @q = Poem.ransack(params[:q])
    @poems = @q.result(:distinct => true).includes(:comments, :likes, :author, :supporters).page(params[:page]).per(10)
  end

  # GET /poems/1
  def show
    @like = Like.new
    @comment = Comment.new
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems
  def create
    @poem = Poem.new(poem_params)

    if @poem.save
      message = 'Poem was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @poem, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /poems/1
  def update
    if @poem.update(poem_params)
      redirect_to @poem, notice: 'Poem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /poems/1
  def destroy
    @poem.destroy
    message = "Poem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to poems_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poem_params
      params.require(:poem).permit(:title, :body, :author_id, :date, :commentary)
    end
end
