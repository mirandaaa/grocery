require 'spec_helper'

describe RecipesController do
  let(:recipes) { create_list :recipe, 4 }

  describe 'GET #index' do
    it 'returns a successful response' do
      expect(response.status).to eq(200)
    end
  end
  
  # describe 'POST #create' do
  #   it 'should create a new recipe' do
  #     expect(response).to redirect_to(recipe_path)
  #     expect(flash[:notice]).to be_present
  #   end
  # end
end
