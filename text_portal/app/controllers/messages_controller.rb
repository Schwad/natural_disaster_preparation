class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reply
    ManageMessage.call(phone_number: params[:From], message: params[:Body])
  end

end
