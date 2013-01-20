require "spec_helper"

describe "Transaction routing" do
  it "should route the index" do
    get("/transactions").should route_to("transactions#index")
  end

  it "should route the upload" do
    get("/transactions/upload").should route_to("transactions#upload")
  end

  it "should route the upload" do
    post("/transactions/upload").should route_to("transactions#do_upload")
  end
end