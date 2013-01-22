require "spec_helper"

describe "Transaction routing" do
  it "should route the upload" do
    post("/upload/transactions").should route_to("upload#transactions")
  end
end