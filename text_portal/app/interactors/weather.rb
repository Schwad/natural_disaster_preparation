# frozen_string_literal: true

##
# Interactor object that sends weather if required
#
class Weather
  include Interactor

  def call
    if context.message.split(",")[0]&.downcase == 'weather'
      TwilioTextMessenger.new(WeatherService.new(context.message).call, context.user.phone_number).call
      context.fail!
    end
  end
end
