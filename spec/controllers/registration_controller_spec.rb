require 'spec_helper'

describe RegistrationController do

  describe "GET 'activate'" do
    it "returns http success" do
      get 'activate'
      response.should be_success
    end
  end

  describe "GET 'stopping'" do
    it "returns http success" do
      get 'stopping'
      response.should be_success
    end
  end

end
