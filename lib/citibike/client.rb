# encoding: UTF-8

require 'citibike/api'
require 'citibike/response'

module Citibike

  # Client for interacting with the Citibike NYC
  # unofficial API
  class Client

    attr_reader :options, :connection

    VALID_KEYS = [:unwrapped]

    def initialize(opts = {})
      @options = {}
      # Parse out the valid keys for this class
      VALID_KEYS.each do |vk|
        @options[vk] = opts[vk]
      end

      # Raw forces unwrapped to be true
      if opts[:raw]
        @options[:unwrapped] = true
      end

      @connection = Citibike::Connection.new(opts)
    end

    #
    # Wrapper around a call to list all stations
    #
    # @return [Response] [A response object unless]
    def stations
      resp = self.connection.request(
        :get,
        Citibike::Station.path
      )

      return resp if @options[:unwrapped]

      Citibike::Responses::Station.new(resp)
    end

    def updates
      resp = self.connection.request(
        :get,
        Citibike::Update.path
      )

      return resp if @options[:unwrapped]

      Citibike::Responses::Update.new(resp)
    end

    def helmets
      resp = self.connection.request(
        :get,
        Citibike::Station.path
      )

      return resp if @options[:unwrapped]

      Citibike::Responses::Helmet.new(resp)
    end

    def branches
      resp = self.connection.request(
        :get,
        Citibike::Station.path
      )

      return resp if @options[:unwrapped]

      Citibike::Responses::Branch.new(resp)
    end

    def self.stations
      Citibike::Responses::Station.new(
        # create a new connection in case
        self.connection.request(
          :get,
          Citibike::Station.path
        )
      )
    end

    def self.updates
      Citibike::Responses::Update.new(
        # create a new connection in case
        self.connection.request(
          :get,
          Citibike::Update.path
        )
      )
    end

    def self.helmets
      Citibike::Responses::Helmet.new(
        self.connection.request(
          :get,
          Citibike::Helmet.path
        )
      )
    end

    def self.branches
      Citibike::Responses::Branch.new(
        self.connection.request(
          :get,
          Citibike::Branch.path
        )
      )
    end

    private

      def self.connection
        @connection ||= Citibike::Connection.new
      end

  end

end