require "uploadcare-ruby/version"
require 'uploadcare-ruby/uploadcare'
require 'uploadcare-ruby/file'

module Uploadcare
	def self.new(public_key, private_key)
		Uploadcare.new(public_key, private_key)
	end
end