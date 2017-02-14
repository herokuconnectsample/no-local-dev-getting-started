# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end

get "/contacts" do
  @contacts = Contact.all
  
#  @contact_21 = Contact.find_by(id: 21)
#  logger.info('修正前')
#  logger.info(@contact_21.name)
#  @contact_21.name="99999999"
#  @contact_21.save!
#  logger.info('修正後')
#  logger.info(@contact_21.name)
  
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
