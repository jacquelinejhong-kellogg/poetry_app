class Api::V1::PoetsController < Api::V1::GraphitiController
  def index
    poets = PoetResource.all(params)
    respond_with(poets)
  end

  def show
    poet = PoetResource.find(params)
    respond_with(poet)
  end

  def create
    poet = PoetResource.build(params)

    if poet.save
      render jsonapi: poet, status: :created
    else
      render jsonapi_errors: poet
    end
  end

  def update
    poet = PoetResource.find(params)

    if poet.update_attributes
      render jsonapi: poet
    else
      render jsonapi_errors: poet
    end
  end

  def destroy
    poet = PoetResource.find(params)

    if poet.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: poet
    end
  end
end
