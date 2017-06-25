class GramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = current_user.grams.create(gram_params)
    if @gram.valid? 
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gram_params
    params.require(:gram).permit(:message)
  end

  #add helper method to verify user is allowed to upload grams?
  #def require_authorized_for_current_user
  #end
end
