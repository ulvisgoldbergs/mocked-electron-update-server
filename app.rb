require 'sinatra'
require 'json'

get '/update' do

	# If queried for 9.9.9, then respond 204 no-content
	status 204 if params['current_version'] == "9.9.9"

  content_type :json
  update_response.to_json
end

get '/package.zip' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
 	send_file 'client-app-9.9.9.zip.example'
end

private

def update_response 
	{
		name: "9.9.9", 
		notes: "These are the release notes", 
		url: "http://localhost:1337/package.zip"
	}
end
