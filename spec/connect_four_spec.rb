require 'spec_helper'

RSpec.describe ConnectFour do
    describe "#initialize" do
        it "exists" do
           new_game = ConnectFour.new
           
           expect(new_game).to be_instance_of(ConnectFour)
        end
    end
end