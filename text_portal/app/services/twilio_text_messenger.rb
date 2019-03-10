class TwilioTextMessenger
  attr_reader :message

  def initialize(message, number)
    @message = message
    @number = number
  end

  def call
    client = Twilio::REST::Client.new
      client.messages.create({
        from: Rails.application.credentials.twilio_phone_number,
        to: @number,
        body: @message
      })
  end
end
