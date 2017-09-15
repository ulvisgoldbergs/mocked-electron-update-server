require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 8089
# /update?product=vmware&channel=test&current_version=1.0.13&platform=darwin&arch=x64
get '/update' do

	# If queried for 9.9.9, then respond 204 no-content
	status 204 if params['current_version'] == "9.9.9"
	product = params['product']
	case product
	when "authy"
		if params['arch'] == 'x64'
			if params['platform'] == "darwin"
				content_type :json
				update_authy_osx64_response.to_json
			elsif params['platform'] == "win32"
				content_type :json
				update_authy_win64_response.to_json
			end
		elsif params['arch'] == 'x32'
			if params['platform'] == "win32"
				content_type :json
				update_authy_win32_response.to_json
			end
		end
	when "catech"
		if params['arch'] == 'x64'
			if params['platform'] == "darwin"
				content_type :json
				update_catech_osx64_response.to_json
			elsif params['platform'] == "win32"
				content_type :json
				update_catech_win64_response.to_json
			end
		elsif params['arch'] == 'x32'
			if params['platform'] == "win32"
				content_type :json
				update_catech_win32_response.to_json
			end
		end
	when "quest"
		if params['arch'] == 'x64'
			if params['platform'] == "darwin"
				content_type :json
				update_quest_osx64_response.to_json
			elsif params['platform'] == "win32"
				content_type :json
				update_quest_win64_response.to_json
			end
		elsif params['arch'] == 'x32'
			if params['platform'] == "win32"
				content_type :json
				update_quest_win32_response.to_json
			end
		end
	when "vmware"
		if params['arch'] == 'x64'
			if params['platform'] == "darwin"
				content_type :json
				update_vmware_osx64_response.to_json
			elsif params['platform'] == "win32"
				content_type :json
				update_vmware_win64_response.to_json
			end
		elsif params['arch'] == 'x32'
			if params['platform'] == "win32"
				content_type :json
				update_vmware_win32_response.to_json
	else
		status 204
	end

end

# Authy

get '/authy_osx64.zip' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/authy/osx/osx64.zip'
end

get '/authy_win64.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/authy/win/win64.nupkg'
end

get '/authy_win32.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/authy/win/win32.nupkg'
end

def update_authy_osx64_response 
	{
		url: "http://#{request.host}:8089/authy_osx64.zip",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_authy_win64_response 
	{
		url: "http://#{request.host}:8089/authy_win64.nupkg",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_authy_win32_response 
{
	url: "http://#{request.host}:8089/authy_win32.nupkg",
	name: "9.9.9",
	notes: "## 9.9.9\nFor automated testing purpose only",
	pub_date: "2017-05-02T11:51:38.000Z"
}
end

# Catech

get '/catech_osx64.zip' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/catech/osx/osx64.zip'
end

get '/catech_win64.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/catech/win/win64.nupkg'
end

get '/catech_win32.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/catech/win/win32.nupkg'
end

def update_catech_osx64_response 
	{
		url: "http://#{request.host}:8089/catech_osx64.zip",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_catech_authy_win64_response 
	{
		url: "http://#{request.host}:8089/catech_win64.nupkg",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_catech_authy_win32_response 
{
	url: "http://#{request.host}:8089/catech_win32.nupkg",
	name: "9.9.9",
	notes: "## 9.9.9\nFor automated testing purpose only",
	pub_date: "2017-05-02T11:51:38.000Z"
}
end

# Quest

get '/quest_osx64.zip' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/quest/osx/osx64.zip'
end

get '/quest_win64.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/quest/win/win64.nupkg'
end

get '/quest_win32.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/quest/win/win32.nupkg'
end

def update_quest_osx64_response 
	{
		url: "http://#{request.host}:8089/quest_osx64.zip",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_quest_win64_response 
	{
		url: "http://#{request.host}:8089/quest_win64.nupkg",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_quest_win32_response 
{
	url: "http://#{request.host}:8089/quest_win32.nupkg",
	name: "9.9.9",
	notes: "## 9.9.9\nFor automated testing purpose only",
	pub_date: "2017-05-02T11:51:38.000Z"
}
end

# Vmware

get '/vmware_osx64.zip' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/vmware/osx/osx64.zip'
end

get '/vmware_win64.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/vmware/win/win64.nupkg'
end

get '/vmware_win32.nupkg' do
	# This is a local file in the same folder. 
	# It should contain a build with 9.9.9 version so next updates is up to date 
	 send_file 'builds/vmware/win/win32.nupkg'
end


def update_vmware_osx64_response 
	{
		url: "http://#{request.host}:8089/vmware_osx64.zip",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_vmware_win64_response 
	{
		url: "http://#{request.host}:8089/vmware_win64.nupkg",
		name: "9.9.9",
		notes: "## 9.9.9\nFor automated testing purpose only",
		pub_date: "2017-05-02T11:51:38.000Z"
	}
end

def update_vmware_win32_response 
{
	url: "http://#{request.host}:8089/vmware_win32.nupkg",
	name: "9.9.9",
	notes: "## 9.9.9\nFor automated testing purpose only",
	pub_date: "2017-05-02T11:51:38.000Z"
}
end