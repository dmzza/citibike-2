require 'spec_helper'

describe Citibike::Station do

  let(:updates) do
    Citibike.updates
  end

  let(:stat) do
    updates.first
  end

  around(:each) do |example|
    VCR.use_cassette(:update, record: :new_episodes) do
      example.run
    end
  end

  it "should provide consistent accessor methods" do
    stat.should respond_to(:last_update)
    stat.available_docks.should be_a(Integer)
    stat.available_bikes.should be_a(Integer)

    stat.should be_active
  end

end
