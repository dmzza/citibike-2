# encoding: UTF-8

module Citibike
  # Represents an Update in the Citibike system and
  # holds the data provided from the API itself along with
  # some convenience methods accessing it
  class Update < Api

    def self.path
      'v1/stations/updates'
    end
    #
    # Returns if this station is active
    #
    # @return [Bool] [Stations is active or not]
    def active?
      self.internal_object['status'] == 'Active'
    end

    #
    # Returns the number of available bikes at this station
    #
    # @return [Integer] [Number of available bikes]
    def available_bikes
      self['availableBikes']
    end

    #
    # Returns the number of available docks at this station
    #
    # @return [Integer] [Number of available docks]
    def available_docks
      self['availableDocks']
    end

    #
    # Returns the time of last update
    #
    # @return [Integer] [Time of last update]
    def last_update
      self['lastCommunication']
    end

  end

end
