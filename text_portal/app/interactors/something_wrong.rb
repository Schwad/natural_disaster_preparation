# frozen_string_literal: true

##
# Help output sent again if the incoming command did not match any prior interactor
#
class SomethingWrong
  include Interactor

  def call
    message = <<-EOF
Hello! Thanks for using TextPortal. It seems that you have sent a request we do not understand. Here's some help! You can manually call help any time by texting "help me"

A traditional message can be sent as a single command, with splitting commas for further inputs. We currently support News Headlines, Weather, Maps locations.

Example queries
=============

To just get latest British headlines (five randomized):

news

To search for a particular query:

news, cornwall

news, prince william

To get the weather forecast:

weather, postcode (i.e. PL220BL)

To get directions:

directions, LOCATION_A, LOCATION_B

============

If you need further help, contact the maintainer at nicholas.schwaderer@gmail.com
    EOF
    TwilioTextMessenger.new(message, context.user.phone_number).call
  end
end
