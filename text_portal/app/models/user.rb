class User < ApplicationRecord
  serialize :configurations, Hash
  serialize :queries, Array
  validates :phone_number, presence: true

  ## Configurations (may extend to store_accessor and hstore)
  #
  # subscribed_to_auto_brit_updates
end
