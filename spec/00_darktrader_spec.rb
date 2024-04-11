require_relative '../lib/00_darktrader.rb'

describe "the crypto function" do
    describe "Basic functionality" do
      it "does not return an empty result" do
        expect(crypto_function).not_to eq (' ')
      end
      it "does not return an error" do
        expect(crypto_function).not_to eq (nil)
      end
      it "does not give you a list over 100 currencies" do
        expect(crypto_function.length).to be <= 100
      end
    end
end   

