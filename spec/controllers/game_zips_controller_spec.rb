require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GameZipsController do

  # This should return the minimal set of attributes required to create a valid
  # GameZip. As you add validations to GameZip, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GameZipsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  # describe "GET index" do
  #   it "assigns all game_zips as @game_zips" do
  #     game_zip = GameZip.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:game_zips).should eq([game_zip])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested game_zip as @game_zip" do
  #     game_zip = GameZip.create! valid_attributes
  #     get :show, {:id => game_zip.to_param}, valid_session
  #     assigns(:game_zip).should eq(game_zip)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new game_zip as @game_zip" do
  #     get :new, {}, valid_session
  #     assigns(:game_zip).should be_a_new(GameZip)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested game_zip as @game_zip" do
  #     game_zip = GameZip.create! valid_attributes
  #     get :edit, {:id => game_zip.to_param}, valid_session
  #     assigns(:game_zip).should eq(game_zip)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new GameZip" do
  #       expect {
  #         post :create, {:game_zip => valid_attributes}, valid_session
  #       }.to change(GameZip, :count).by(1)
  #     end

  #     it "assigns a newly created game_zip as @game_zip" do
  #       post :create, {:game_zip => valid_attributes}, valid_session
  #       assigns(:game_zip).should be_a(GameZip)
  #       assigns(:game_zip).should be_persisted
  #     end

  #     it "redirects to the created game_zip" do
  #       post :create, {:game_zip => valid_attributes}, valid_session
  #       response.should redirect_to(GameZip.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved game_zip as @game_zip" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       GameZip.any_instance.stub(:save).and_return(false)
  #       post :create, {:game_zip => {}}, valid_session
  #       assigns(:game_zip).should be_a_new(GameZip)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       GameZip.any_instance.stub(:save).and_return(false)
  #       post :create, {:game_zip => {}}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested game_zip" do
  #       game_zip = GameZip.create! valid_attributes
  #       # Assuming there are no other game_zips in the database, this
  #       # specifies that the GameZip created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       GameZip.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, {:id => game_zip.to_param, :game_zip => {'these' => 'params'}}, valid_session
  #     end

  #     it "assigns the requested game_zip as @game_zip" do
  #       game_zip = GameZip.create! valid_attributes
  #       put :update, {:id => game_zip.to_param, :game_zip => valid_attributes}, valid_session
  #       assigns(:game_zip).should eq(game_zip)
  #     end

  #     it "redirects to the game_zip" do
  #       game_zip = GameZip.create! valid_attributes
  #       put :update, {:id => game_zip.to_param, :game_zip => valid_attributes}, valid_session
  #       response.should redirect_to(game_zip)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the game_zip as @game_zip" do
  #       game_zip = GameZip.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       GameZip.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => game_zip.to_param, :game_zip => {}}, valid_session
  #       assigns(:game_zip).should eq(game_zip)
  #     end

  #     it "re-renders the 'edit' template" do
  #       game_zip = GameZip.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       GameZip.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => game_zip.to_param, :game_zip => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested game_zip" do
  #     game_zip = GameZip.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => game_zip.to_param}, valid_session
  #     }.to change(GameZip, :count).by(-1)
  #   end

  #   it "redirects to the game_zips list" do
  #     game_zip = GameZip.create! valid_attributes
  #     delete :destroy, {:id => game_zip.to_param}, valid_session
  #     response.should redirect_to(game_zips_url)
  #   end
  # end

end
