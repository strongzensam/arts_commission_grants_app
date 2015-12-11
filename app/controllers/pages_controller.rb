class PagesController < ApplicationController
  def index 
    @api_result_SF_Events = Unirest.get("https://data.sfgov.org/resource/mxvq-mfs5.json")
    api_result_forecast = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    api_result_forecast_oakland = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22oakland%2C%20ca%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=").body
    @temp = api_result_forecast["query"]["results"]["channel"]["item"]["forecast"]
    @temp_oakland = api_result_forecast_oakland["query"]["results"]["channel"]["item"]["forecast"]
  end
end
