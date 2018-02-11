require "gmean/version"
require 'nokogiri'
require 'open-uri'
require 'net/https'

module Gmean
  class Crawl
  	def initialize(name)
			@name = name[0]
		end
		def scrap
			user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
			doc = Nokogiri::HTML(open("https://www.google.co.in/search?q=#{@name.to_s}+meaning", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => user_agent))
			if doc.at_css('.lr_dct_ent_ph+ .vmod ._Jig span')
			  word_meaning = doc.at_css('.lr_dct_ent_ph+ .vmod ._Jig span').text()
			elsif doc.at_css("._s8w")
			  word_meaning = doc.at_css("._s8w").text()
			else
			  word_meaning = "Not Found!"
			end
			puts "\033[32m Meaning: \033[0m \e[1m#{word_meaning}\e[0m"
		end
  end
end
