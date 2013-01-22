require "spec_helper"

describe "Transaction routing" do
  it "should route the index" do
    get("/transactions").should route_to("transactions#index")
  end

  it "should route the details" do
    get("/transactions/1").should route_to("transactions#show", id: "1")
  end

  it "should route the details" do
    get("/transactions/unattached").should route_to("transactions#unattached")
  end
end