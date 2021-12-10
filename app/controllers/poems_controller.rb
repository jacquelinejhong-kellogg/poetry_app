class PoemsController < ApplicationController
  before_action :set_poem, only: %i[show edit update destroy]

  def index
    @q = Poem.ransack(params[:q])
    @poems = @q.result(distinct: true).includes(:comments, :likes, :author,
                                                :supporters).page(params[:page]).per(10)
  end

  def show
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @poem = Poem.new
  end

  def edit; end

  def create
    @poem = Poem.new(poem_params)

    if @poem.save
      message = "Poem was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @poem, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @poem.update(poem_params)
      redirect_to @poem, notice: "Poem was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @poem.destroy
    message = "Poem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to poems_url, notice: message
    end
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :body, :author_id, :date,
                                 :commentary)
  end
end
