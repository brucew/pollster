require 'spec_helper'

describe PollsController do

  def valid_attributes
    attrs = FactoryGirl.attributes_for(:poll)
    attrs[:items_attributes] = { '0' => FactoryGirl.attributes_for(:item), '1' => FactoryGirl.attributes_for(:item) }
    attrs
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all polls as @polls" do
      poll = FactoryGirl.create(:poll)
      get :index, {}, valid_session
      assigns(:polls).should eq([poll])
    end
  end

  describe "GET show" do
    it "assigns the requested poll as @poll" do
      poll = FactoryGirl.create(:poll)
      get :show, {:id => poll.to_param}, valid_session
      assigns(:poll).should eq(poll)
    end
  end

  describe "GET new" do
    it "assigns a new poll as @poll" do
      get :new, {}, valid_session
      assigns(:poll).should be_a_new(Poll)
    end
  end

  describe "GET edit" do
    it "assigns the requested poll as @poll" do
      poll = FactoryGirl.create(:poll)
      get :edit, {:id => poll.to_param}, valid_session
      assigns(:poll).should eq(poll)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Poll" do
        expect {
          post :create, {:poll => valid_attributes}, valid_session
        }.to change(Poll, :count).by(1)
      end

      it "assigns a newly created poll as @poll" do
        post :create, {:poll => valid_attributes}, valid_session
        assigns(:poll).should be_a(Poll)
        assigns(:poll).should be_persisted
      end

      it "redirects to the created poll" do
        post :create, {:poll => valid_attributes}, valid_session
        response.should redirect_to(Poll.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved poll as @poll" do
        # Trigger the behavior that occurs when invalid params are submitted
        Poll.any_instance.stub(:save).and_return(false)
        post :create, {:poll => { "question" => "" }}, valid_session
        assigns(:poll).should be_a_new(Poll)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Poll.any_instance.stub(:save).and_return(false)
        post :create, {:poll => { "question" => "" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested poll" do
        poll = Poll.create! valid_attributes
        Poll.any_instance.should_receive(:update_attributes).with({ "question" => "MyText" })
        put :update, {:id => poll.to_param, :poll => { "question" => "MyText" }}, valid_session
      end

      it "assigns the requested poll as @poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => valid_attributes}, valid_session
        assigns(:poll).should eq(poll)
      end

      it "redirects to the poll" do
        poll = Poll.create! valid_attributes
        put :update, {:id => poll.to_param, :poll => valid_attributes}, valid_session
        response.should redirect_to(poll)
      end
    end

    describe "with invalid params" do
      it "assigns the poll as @poll" do
        poll = Poll.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Poll.any_instance.stub(:save).and_return(false)
        put :update, {:id => poll.to_param, :poll => { "question" => "" }}, valid_session
        assigns(:poll).should eq(poll)
      end

      it "re-renders the 'edit' template" do
        poll = Poll.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Poll.any_instance.stub(:save).and_return(false)
        put :update, {:id => poll.to_param, :poll => { "question" => "" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested poll" do
      poll = Poll.create! valid_attributes
      expect {
        delete :destroy, {:id => poll.to_param}, valid_session
      }.to change(Poll, :count).by(-1)
    end

    it "redirects to the polls list" do
      poll = Poll.create! valid_attributes
      delete :destroy, {:id => poll.to_param}, valid_session
      response.should redirect_to(polls_url)
    end
  end

end
