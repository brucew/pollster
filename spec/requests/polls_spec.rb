require 'spec_helper'

describe "Polls" do
  describe "GET /polls" do
    it "should succeed" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get polls_path
      response.status.should be(200)
    end
  end
end
