require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do
  def parsed_body
    JSON.parse(response.body)
  end

  describe "RDBMS-backed" do
    before(:each) { City .delete_all }
    after(:each) { City.delete_all }

    it "create RDBMS-backed mode" do
      object=City.create(:name=>"test")
      expect(City.find(object.id).name).to eq("test")
    end

    it "expose RDBMS-backed API resource" do
      object=City.create(:name=>"test")
      expect(cities_path).to eq("/api/cities")
      get cities_path(object.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq("test")
    end
  end

  # describe "MongoDB-backed" do
  #   before(:each) { Bar.delete_all }
  #   after(:each) { Bar.delete_all }

  #   it "create MongoDB-backed model" do
  #     object=Bar.create(:name=>"test")
  #     expect(Bar.find(object.id).name).to eq("test")
  #   end

  #   it "expose MongoDB-backed API resource" do
  #     object=Bar.create(:name=>"test")
  #     expect(bars_path).to eq("/api/bars")
  #     get bar_path(object.id)
  #     expect(response).to have_http_status(:ok)
  #     expect(parsed_body["name"]).to eq("test")
  #     expect(parsed_body).to include("created_at")
  #     expect(parsed_body).to include("id"=>object.id.to_s)
  #   end
  # end
end
