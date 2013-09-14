require 'spec_helper'

describe Citibike do

  it "should proxy methods to Citibike::Client" do
    Citibike::Client.expects(:stations)
    Citibike::Client.expects(:updates)
    Citibike::Client.expects(:helmets)
    Citibike::Client.expects(:branches)

    Citibike.stations
    Citibike.updates
    Citibike.helmets
    Citibike.branches
  end

end