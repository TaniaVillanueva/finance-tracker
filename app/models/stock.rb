require 'httparty'
  
class Stock < ApplicationRecord 
    def self.company_lookup(ticker_symbol)
        response = HTTParty.get("https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{ticker_symbol}&apikey=S7QO4Y2Z1ESAVOSP")
        if response.code == 200
            response.parsed_response['Name']
        else
             nil
        end
    end
    def self.new_lookup(ticker_symbol)
        response = HTTParty.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{ticker_symbol}&apikey=S7QO4Y2Z1ESAVOSP")
        if response.code == 200 && response.parsed_response['Global Quote']
            last_price = response.parsed_response['Global Quote']['05. price']
            name = company_lookup(ticker_symbol)
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        else           
            nil
        end
    end
end