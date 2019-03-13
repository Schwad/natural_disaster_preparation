# frozen_string_literal: true

##
# Interactor object that runs directions service
#
class Directions
  include Interactor

  def call
    if context.message.split(",")[0]&.downcase == 'directions'
      begin
        TwilioTextMessenger.new(DirectionsService.new(context.message).call, context.user.phone_number).call
      rescue => e
        TwilioTextMessenger.new(DirectionsService.new("We are so sorry, there has been an error! The text may be too long, you can try somewhere closer.").call, context.user.phone_number).call
      end
      context.fail!
    end
  end
end
