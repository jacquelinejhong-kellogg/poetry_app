class Api::V1::PoemsController < Api::V1::GraphitiController
  def index
    poems = PoemResource.all(params)
    respond_with(poems)
  end

  def show
    poem = PoemResource.find(params)
    respond_with(poem)
  end

  def create
    poem = PoemResource.build(params)

    if poem.save
      render jsonapi: poem, status: 201
    else
      render jsonapi_errors: poem
    end
  end

  def update
    poem = PoemResource.find(params)

    if poem.update_attributes
      render jsonapi: poem
    else
      render jsonapi_errors: poem
    end
  end

  def destroy
    poem = PoemResource.find(params)

    if poem.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: poem
    end
  end
end
