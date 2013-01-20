require "spec_helper"

describe ImportTransactionsCommandHandler do
  let(:handler){ImportTransactionsCommandHandler.new}

  describe "csv to hash" do

    context "a csv with one row" do

      it "converts to an array with one line" do
        handler.csv_to_hash("naam;nummer\rtest;145").should == [{"naam" => "test", "nummer" => "145"}]
      end

      it "converts to an array with two line" do
        handler.csv_to_hash("naam;nummer\rhello;123\rworld;456").should == [
            {"naam" => "hello", "nummer" => "123"},
            {"naam" => "world", "nummer" => "456"}
        ]
      end
    end

    context "an empty csv" do

      it "returns an empty array" do
        handler.csv_to_hash("").should == []
      end
    end
  end

  describe "convert transaction" do
    let(:row){{
        "Rekeningnummer" => "ABC",
        "Naam van de rekening" => "DEF",
        "Rekening tegenpartij" => "GHI",
        "Omzetnummer" => 23,
        "Boekingsdatum" => "31/12/2012",
        "Valutadatum" => "30/11/2011",
        "Bedrag" => "12,34",
        "Munteenheid" => "EUR",
        "Omschrijving" => "Een omschrijving",
        "Detail" => "Een detail",
        "Bericht" => "Een bericht",
    }}
    subject{ handler.convert_transaction(row) }
    its(:account_number){should == "ABC"}
    its(:account_name){should == "DEF"}
    its(:recipient_account_number){should == "GHI"}
    its(:number){should == 23}
    its(:execution_date){should == Date.new(2012, 12, 31)}
    its(:value_date){should == Date.new(2011, 11, 30)}
    its(:amount){should == 12.34}
    its(:currency){should == "EUR"}
    its(:description){should == "Een omschrijving"}
    its(:detail){should == "Een detail"}
    its(:message){should == "Een bericht"}

    it "works without amount" do
      row["Bedrag"] = nil
      subject.amount.should == nil
    end

    #Rekeningnummer;Naam van de rekening;Rekening tegenpartij;Omzetnummer;
    #Boekingsdatum;Valutadatum;Bedrag;Munteenheid;
    #Omschrijving;Detail van de omzet;Bericht

  end
end