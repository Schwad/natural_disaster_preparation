# frozen_string_literal: true

##
# Primary message management organizer interactor used within MaraBot
#
class ManageMessage
  include Interactor::Organizer

  organize VerifyUser, SendBritishHeadlines

  # To Include:
  # - HelpResponse
  # - Update Subscriptions
  # - Manage Queries
end
