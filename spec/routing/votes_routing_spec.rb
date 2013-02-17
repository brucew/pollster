require 'spec_helper'

describe VotesController do
  describe 'routing' do

    it 'routes to #create' do
      post('/items/1/votes').should route_to('votes#create', item_id: '1')
    end

  end
end
