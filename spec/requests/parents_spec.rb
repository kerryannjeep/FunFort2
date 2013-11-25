require 'spec_helper'

describe "Parents" do
  describe "GET /parents" do
    it "lists parents" do
      get parents_path
      response.status.should be(200)
    end
  end
end
