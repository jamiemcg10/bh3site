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

describe SiteSectionsController do

  # This should return the minimal set of attributes required to create a valid
  # SiteSection. As you add validations to SiteSection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "tag" => "MyString", "data_type" => "html", "value" => "<b>some value</b>" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SiteSectionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all site_sections as @site_sections" do
      site_section = SiteSection.create! valid_attributes
      get :index, {}, valid_session
      assigns(:site_sections).should eq([site_section])
    end
  end

  describe "GET show" do
    it "assigns the requested site_section as @site_section" do
      site_section = SiteSection.create! valid_attributes
      get :show, {:id => site_section.to_param}, valid_session
      assigns(:site_section).should eq(site_section)
    end
  end

  describe "GET new" do
    it "assigns a new site_section as @site_section" do
      get :new, {}, valid_session
      assigns(:site_section).should be_a_new(SiteSection)
    end
  end

  describe "GET edit" do
    it "assigns the requested site_section as @site_section" do
      site_section = SiteSection.create! valid_attributes
      get :edit, {:id => site_section.to_param}, valid_session
      assigns(:site_section).should eq(site_section)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SiteSection" do
        expect {
          post :create, {:site_section => valid_attributes}, valid_session
        }.to change(SiteSection, :count).by(1)
      end

      it "assigns a newly created site_section as @site_section" do
        post :create, {:site_section => valid_attributes}, valid_session
        assigns(:site_section).should be_a(SiteSection)
        assigns(:site_section).should be_persisted
      end

      it "redirects to the created site_section" do
        post :create, {:site_section => valid_attributes}, valid_session
        response.should redirect_to(SiteSection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site_section as @site_section" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteSection.any_instance.stub(:save).and_return(false)
        post :create, {:site_section => { "data_type" => "invalid value" }}, valid_session
        assigns(:site_section).should be_a_new(SiteSection)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteSection.any_instance.stub(:save).and_return(false)
        post :create, {:site_section => { "tag" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested site_section" do
        site_section = SiteSection.create! valid_attributes
        # Assuming there are no other site_sections in the database, this
        # specifies that the SiteSection created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SiteSection.any_instance.should_receive(:update).with({ "tag" => "MyString" })
        put :update, {:id => site_section.to_param, :site_section => { "tag" => "MyString" }}, valid_session
      end

      it "assigns the requested site_section as @site_section" do
        site_section = SiteSection.create! valid_attributes
        put :update, {:id => site_section.to_param, :site_section => valid_attributes}, valid_session
        assigns(:site_section).should eq(site_section)
      end

      it "redirects to the site_section" do
        site_section = SiteSection.create! valid_attributes
        put :update, {:id => site_section.to_param, :site_section => valid_attributes}, valid_session
        response.should redirect_to(site_section)
      end
    end

    describe "with invalid params" do
      it "assigns the site_section as @site_section" do
        site_section = SiteSection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteSection.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_section.to_param, :site_section => { "tag" => "MyString", "data_type" => "invalid", "value" => "<b>some value</b>" }}, valid_session
        assigns(:site_section).should eq(site_section)
      end

      it "re-renders the 'edit' template" do
        site_section = SiteSection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteSection.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_section.to_param, :site_section => { "tag" => "MyString", "data_type" => "invalid", "value" => "<b>some value</b>" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site_section" do
      site_section = SiteSection.create! valid_attributes
      expect {
        delete :destroy, {:id => site_section.to_param}, valid_session
      }.to change(SiteSection, :count).by(-1)
    end

    it "redirects to the site_sections list" do
      site_section = SiteSection.create! valid_attributes
      delete :destroy, {:id => site_section.to_param}, valid_session
      response.should redirect_to(site_sections_url)
    end
  end

end
