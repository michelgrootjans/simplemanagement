require "spec_helper"

describe "Vendors routing" do
  it "should route the index" do
    get("/vendors").should route_to("vendors#index")
  end

  it "should route the details" do
    get("/vendors/1").should route_to("vendors#show", id: "1")
  end

  it "should route the details" do
    get("/vendors/1/edit").should route_to("vendors#edit", id: "1")
  end


  it "should route the update" do
    put("/vendors/1").should route_to("vendors#update", id: "1")
  end
end