require 'rails_helper'

describe "Tags API" do
  it 'sends a list of tags' do
    FactoryGirl.create_list(:tag, 5)

    get '/api/v1/tags'

    expect(response).to be_success

    expect(json.length).to eq(5)
  end


  it 'retrieves a specific tags' do
    tag = FactoryGirl.create(:tag)

    get "/api/v1/tags/#{tag.id}"

    # test for the 200 status-code
    expect(response).to be_success

    expect(json['name']).to eq(tag.name)
  end

  it 'creates note' do
    valid_attribute = { name: '#star_wars' }

    post "/api/v1/tags",
      tag: valid_attribute

    # test for the 200 status-code
    expect(response).to be_success

    expect(json['name']).to eq(valid_attribute[:name])

    expect(Tag.last.name).to eq(valid_attribute[:name])

    expect(Tag.all.length).to eq(1)
  end

  it 'updates tag' do
    tag = FactoryGirl.create(:tag)

    new_attribute = { name: '#batman' }

    put "/api/v1/tags/#{tag.id}",
      tag: new_attribute

    # test for the 200 status-code
    expect(response).to be_success

    expect(Tag.last.name).to eq(new_attribute[:name])

    expect(Tag.all.length).to eq(1)
  end

  it 'deletes tag' do
    tag = FactoryGirl.create(:tag)

    delete "/api/v1/tags/#{tag.id}"

    # test for the 200 status-code
    expect(response).to be_success

    expect(Tag.all.length).to eq(0)
  end
end
