require 'spec_helper'

describe "Polls" do
  describe "GET /polls" do
    it "should respond with SUCCESS" do
      get polls_path
      response.status.should be(200)
    end
  end
end
