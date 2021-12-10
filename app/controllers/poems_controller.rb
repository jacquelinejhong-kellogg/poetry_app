class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems
  def index
    @poems = Poem.all
  end

  # GET /poems/1
  def show
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
      redirect_to @poem, notice: 'Poem was successfully created.'
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
    redirect_to poems_url, notice: 'Poem was successfully destroyed.'
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
