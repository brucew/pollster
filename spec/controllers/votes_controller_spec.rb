require 'spec_helper'

describe VotesController do

  def valid_attributes
    poll = FactoryGirl.create(:poll)
    attrs = FactoryGirl.attributes_for(:vote)
    attrs.delete(:ip_address)
    attrs[:item_id] = poll.items.first.id
    attrs
  end

  def valid_session
    {}
  end

  describe "POST create" do
    before(:each) do
      # Mock a previous page
      @request.env['HTTP_REFERER'] = 'http://test.host/polls/1'
    end

    describe "with valid params" do
      it "creates a new Vote" do
        expect {
          post :create, {:vote => valid_attributes}, valid_session
        }.to change(Vote, :count).by(1)
      end

      it "assigns a newly created vote as @vote" do
        post :create, {:vote => valid_attributes}, valid_session
        assigns(:vote).should be_a(Vote)
        assigns(:vote).should be_persisted
      end

      it "redirects to the previous page" do
        post :create, {:vote => valid_attributes}, valid_session
        response.should redirect_to(:back)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vote as @vote" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => {  }}, valid_session
        assigns(:vote).should be_a_new(Vote)
      end

      it "redirects to the previous page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => {  }}, valid_session
        response.should redirect_to(:back)
      end
    end
  end

end
