require 'httparty'
require 'openssl'
require 'json'

module Uploadcare
	class Uploadcare
		include HTTParty

		def initialize(public_key, private_key, timeout=5, api_base='http://api.uploadcare.com')
			@public_key = public_key
			@private_key = private_key
			@timeout = timeout
			self.class.base_uri api_base
		end
		
		def make_request(verb, uri, data={})
			content = data.to_json
			content = '' if data.empty?
			content_type = 'application/json'
			content_hash = Digest::MD5.hexdigest(content)
			date = Time.now.gmtime.rfc2822.to_s
			sign_string = [verb, content_hash, content_type, date, uri].join("\n")
			sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), @private_key, sign_string)
			headers = {'Authentication' => "UploadCare #{@public_key}:#{sign}", 'Date' => date, 'Content-Type' => content_type}
			self.class.send(verb.downcase, uri, :headers => headers, :body => content)
		end

		def uuid_regex
			/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/
		end

		def file(file_serialized)
			raise "invalid file uuid" unless file_serialized =~ uuid_regex
			file_id = file_serialized.match(uuid_regex)[0]
			file = File.new(self, file_id)
			file.url = file_serialized if file_serialized.start_with?('http')
			file
		end
	end
end