class GramsController < ApplicationController
  #add method to check user authorization for new, create actions

  def index
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.create(gram_params)
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
