require "spec_helper"

describe "Bills routing" do
  it "should route the index" do
    get("/bills").should route_to("bills#index")
  end

  it "should route the details" do
    get("/bills/1").should route_to("bills#show", id: "1")
  end

  it "should route the details" do
    post("/bills/").should route_to("bills#create")
  end

  it "should route attach transaction" do
    put("/bills/1/transactions/2/attach").should route_to("transactions#attach", bill_id: "1", id: "2")
  end
end