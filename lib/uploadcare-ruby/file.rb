module Uploadcare
	class File
		def initialize(ucare, file_id)
			@ucare = ucare
			@file_id = file_id
			@file_info = nil
			@file_url = nil
		end
		
		def api_uri
			"/files/#{@file_id}/"
		end

		def update_info
			@file_info = @ucare.make_request('GET', api_uri).parsed_response
		end

		def info
			update_info unless @file_info
			@file_info
		end

		def url
			@file_url = info['original_file_url'] unless @file_url
			@file_url
		end

		def url=(file_url)
			@file_url = file_url
		end
		
		def keep
			@file_info = @ucare.make_request('POST', api_uri, {'keep' => 1}).parsed_response
		end
	end
end