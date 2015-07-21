require 'open-uri'
require 'net/http'
require 'uri'
require 'rest-client'


require 'pp'

host = "https://itunesconnect.apple.com"
url = host + open(host).read.match(/action="(\/WebObjects\/iTunesConnect.woa\/wo\/.*)"/)[1]
puts url

summaryUrl = 'https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/apps/manageyourapps/summary'
analyticsUrl = 'https://analytics.itunes.apple.com/analytics/api/v1/data/app/detail/measures'


RestClient.post(url, theAccountName: 'k.hayashi.info@gmail.com', theAccountPW: 'Dada6049') do |response, request, result, &block|
  res = RestClient.post analyticsUrl, cookies: response.cookies, :content_type => 'application/x-www-form-urlencoded'
  # pp response.cookies
  pp res
  # pp JSON.parse(response)
end
