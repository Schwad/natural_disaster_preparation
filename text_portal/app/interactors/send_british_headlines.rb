# frozen_string_literal: true

##
# Interactor object that sends british headlines if required
#
class SendBritishHeadlines
  include Interactor

  def call
    if context.message.split(",")[0].downcase == 'news'
      TwilioTextMessenger.new(News.new(context.message).call.join("\n\n---------\n\n"), context.user.phone_number).call
      context.fail!
    end
  end
end
