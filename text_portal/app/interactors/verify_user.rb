# frozen_string_literal: true

##
# Interactor object that runs at the front of the `ManageMessage` interactor, ensuring that all handled messages are from verified users. Rate limits if not.
#
class VerifyUser
  include Interactor

  def call
    if !User.exists?(phone_number: context.phone_number)
      puts 'Failed interactor'
      TwilioTextMessenger.new("Hello 👋, nice to meet you! 🙂 To signup to TextPortal contact nick at nicholas.schwaderer@gmail.com", context.phone_number).call
      context.fail!
    end
    context.user = User.find_by(phone_number: context.phone_number)
    context.response = 'Verify User interactor'
  end
end
