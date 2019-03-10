class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reply
    binding.pry
    # Message will be in params[:Body]
    # pass off to interactor handler here
  end

end
