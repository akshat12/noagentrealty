require 'spec_helper'

describe StatisticsController do

  describe "GET 'user'" do
    it "returns http success" do
      get 'user'
      response.should be_success
    end
  end

  describe "GET 'media'" do
    it "returns http success" do
      get 'media'
      response.should be_success
    end
  end

end
