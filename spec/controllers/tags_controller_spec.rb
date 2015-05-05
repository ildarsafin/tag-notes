require 'rails_helper'

RSpec.describe Api::V1::TagsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(
      :tag,
        name: '#star_wars'
    )
  end

  let(:invalid_attributes) do
    attributes_for(
      :tag,
        name: ''
    )
  end

  describe "GET index" do
    let!(:tag) { create(:tag) }
    it "assigns all tags" do
      get :index

      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET show" do
    let!(:tag) { create(:tag) }
    it "assigns the requested tag" do
      get :show, { id: tag.to_param }

      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe "POST create" do
    context "with valid params" do
      before do
        post :create,
          tag: valid_attributes
      end

      it "creates a new Tag" do
        expect(Tag.count).to eq(1)
      end

      it "assigns a newly created tag" do
        expect(assigns(:tag)).to be_a(Tag)
        expect(assigns(:tag)).to be_persisted
      end

      it "responds with 204" do
        expect(response.status).to eq 201
      end
    end

    describe "with invalid params" do
      before do
        post :create,
          tag: invalid_attributes
      end

      it "responds with 422" do
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT update" do
    let!(:tag) { create(:tag) }

    describe "with valid params" do
      let(:new_attributes) do
        attributes_for(
          :tag,
            name: '#batman'
        )
      end

      before do
        put :update,
          id: tag.to_param,
          tag: new_attributes
      end

      it "updates the requested tag" do
        expect(assigns(:tag).name).to eq new_attributes[:name]
      end

      it "assigns the requested tag as @tag" do
        expect(assigns(:tag)).to eq(tag)
      end

      it "responds with 204" do
        expect(response.status).to eq 204
      end
    end

    describe "with invalid params" do
      before do
        put :update,
          id: tag.to_param,
          tag: invalid_attributes
      end

      it "assigns the tag as @tag" do
        expect(assigns(:tag)).to eq(tag)
      end

      it "responds with 422" do
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE destroy" do
    let!(:tag) { create(:tag) }

    before do
      delete :destroy,
        id: tag.to_param
    end

    it "destroys the requested tag" do
      expect(Tag.count).to eq(0)
    end

    it "responds with 204" do
      expect(response.status).to eq 204
    end
  end
end
