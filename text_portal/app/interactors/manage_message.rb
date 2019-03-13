# frozen_string_literal: true

##
# Primary message management organizer interactor used within MaraBot
#
class ManageMessage
  include Interactor::Organizer

  organize VerifyUser, Help, SendBritishHeadlines, Weather, Directions, SomethingWrong

  # To Include:
  # Weather
  # Directions
end
