require "spec_helper"

describe PollsController do
  describe "routing" do

    it "routes to #index" do
      get("/polls").should route_to("polls#index")
    end

  end
end
