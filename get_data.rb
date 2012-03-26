require 'net/http'
require 'json'

resp = String.new
all_raw_data_array = Array.new
all_json_data_array = Array.new

Net::HTTP.start("bash.org.pl") do |http|
    resp = http.get("/text")
end

all_raw_data_array = resp.body.force_encoding("UTF-8").split(/^%$/)

all_raw_data_array.each do |bash_quote_string|
  bash_quote_json = Hash.new
  bash_quote_string.gsub!(/^$\n/,'')
  
  unless bash_quote_string.nil? || bash_quote_string.empty? 
    lines = bash_quote_string.split($/, 2)
    first_line = lines.shift 
    quote = lines.shift
    bash_quote_json[:id] = first_line.split(' ')[0] 
    bash_quote_json[:url] = first_line.split(' ')[1] 
    bash_quote_json[:quote] = quote

    puts JSON.pretty_generate(bash_quote_json)
  end 
end

