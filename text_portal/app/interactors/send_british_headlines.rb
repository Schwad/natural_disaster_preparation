# frozen_string_literal: true

##
# Interactor object that sends british headlines if required
#
class SendBritishHeadlines
  include Interactor

  def call
    TwilioTextMessenger.new(News.new("british").call.join("\n\n---------\n\n"), context.user.phone_number).call
  end
end
