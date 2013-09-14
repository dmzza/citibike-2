# encoding: UTF-8

module Citibike

  module Responses
    # Represents a list of Update api objects
    class Update < Citibike::Response

      def initialize(data)
        lastUpdate = data['lastUpdate']
        data['results'].collect! { |r| r.merge(:lastUpdate => 1) }
        data['results'].map! { |r| Citibike::Update.new(r) }
        super
      end

    end

  end

end
