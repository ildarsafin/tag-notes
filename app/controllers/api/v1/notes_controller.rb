class Api::V1::NotesController < ApplicationController
  wrap_parameters :note

  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    notes = Note.all

    render json: notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    render json: note
  end

  # POST /notes
  # POST /notes.json
  def create
    note = Note.new(note_params)

    tag_names.each do |tag_name|
      tag = Tag.find_by_name(tag_name)

      if tag
        note.tags.push(tag)
      else
        note.tags.build(name: tag_name)
      end
    end

    if note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    note = Note.find(params[:id])

    if note.update(note_params)
      head :no_content
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    note.destroy

    head :no_content
  end

  private

    def set_note
      note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content)
    end

    def tag_names
      params.require(:tag_names) || []
    end
end
