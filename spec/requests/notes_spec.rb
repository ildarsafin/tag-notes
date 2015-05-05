require 'rails_helper'

describe "Notes API" do
  it 'sends a list of messages' do
    FactoryGirl.create_list(:note, 5)

    get '/api/v1/notes'

    expect(response).to be_success

    expect(json.length).to eq(5)
  end


  it 'retrieves a specific note' do
    note = FactoryGirl.create(:note)

    get "/api/v1/notes/#{note.id}"

    # test for the 200 status-code
    expect(response).to be_success

    expect(json['content']).to eq(note.content)
  end

  it 'creates note' do
    valid_attribute = { content: 'hello world' }

    post "/api/v1/notes",
      note: valid_attribute

    # test for the 200 status-code
    expect(response).to be_success

    expect(json['content']).to eq(valid_attribute[:content])

    expect(Note.last.content).to eq(valid_attribute[:content])

    expect(Note.all.length).to eq(1)
  end

  it 'updates note' do
    note = FactoryGirl.create(:note)

    new_attribute = { content: 'hello world' }

    put "/api/v1/notes/#{note.id}",
      note: new_attribute

    # test for the 200 status-code
    expect(response).to be_success

    expect(Note.last.content).to eq(new_attribute[:content])

    expect(Note.all.length).to eq(1)
  end

  it 'deletes note' do
    note = FactoryGirl.create(:note)

    delete "/api/v1/notes/#{note.id}"

    # test for the 200 status-code
    expect(response).to be_success

    expect(Note.all.length).to eq(0)
  end
end
