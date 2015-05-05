require 'rails_helper'

RSpec.describe Api::V1::NotesController, type: :controller do
  let(:valid_attributes) do
    attributes_for(
      :note,
        content: 'This is Something'
    )
  end

  let(:invalid_attributes) do
    attributes_for(
      :note,
        content: ''
    )
  end

  describe "GET index" do
    let!(:note) { create(:note) }
    it "assigns all notes" do
      get :index
      expect(assigns(:notes)).to eq([note])
    end
  end

  describe "GET show" do
    let!(:note) { create(:note) }
    it "assigns the requested group as @note" do
      get :show, {:id => note.to_param}
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "POST create" do
    context "with valid params" do
      before do
        post :create,
          note: valid_attributes
      end

      it "creates a new note" do
        expect(Note.count).to eq(1)
      end

      it "assigns a newly created note" do
        expect(assigns(:note)).to be_a(Note)
        expect(assigns(:note)).to be_persisted
      end

      it "responds with 204" do
        expect(response.status).to eq 201
      end
    end

    describe "with invalid params" do
      before do
        post :create,
          note: invalid_attributes
      end

      it "responds with 422" do
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT update" do
    let!(:note) { create(:note) }
    describe "with valid params" do
      let(:new_attributes) do
        attributes_for(
          :note,
            content: 'Something'
        )
      end

      before do
        put :update,
          id: note.to_param,
          note: new_attributes
      end

      it "updates the requested note" do
        expect(assigns(:note).content).to eq new_attributes[:content]
      end

      it "assigns the requested note as @note" do
        expect(assigns(:note)).to eq(note)
      end

      it "responds with 204" do
        expect(response.status).to eq 204
      end
    end

    describe "with invalid params" do
      before do
        put :update,
          id: note.to_param,
          note: invalid_attributes
      end
      it "assigns the note as @note" do
        expect(assigns(:note)).to eq(note)
      end

      it "responds with 422" do
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE destroy" do
    let!(:note) { create(:note) }
    before do
      delete :destroy,
        id: note.to_param
    end
    it "destroys the requested note" do
      expect(Note.count).to eq(0)
    end

    it "responds with 204" do
      expect(response.status).to eq 204
    end
  end
end
