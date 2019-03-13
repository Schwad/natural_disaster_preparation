# frozen_string_literal: true

##
# Help output if requested
#
class Help
  include Interactor

  def call
    if context.message.split(",")[0].downcase == "help me"
      message = <<-EOF
Hello! Thanks for using TextPortal. You've asked for help.

A traditional message can be sent as a single command, with splitting commas for further inputs. We currently support News Headlines, Weather, Maps locations.

Example queries
==============

To just get latest British headlines (five randomized):

news

To search for a particular query:

news, cornwall

news, prince william

To get the weather forecast:

weather, postcode (i.e. PL220BL)

To get directions:

directions, LOCATION_A, LOCATION_B

=============

If you need further help, contact the maintainer at nicholas.schwaderer@gmail.com
      EOF
      TwilioTextMessenger.new(message, context.user.phone_number).call
      context.fail!
    end
  end
end
