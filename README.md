# Uploadcare Ruby Gem

Simple ruby gem to interact with the Uploadcare API

## Example Usage

	require 'uploadcare'
	pubkey = "d1531fba1b7fd176feaec8d1e7d86650ac549b9644e9279197a8c901243509dc"
	pvtkey = "2f769cf086ece700f69fc58fb61e64a7708fee777068dc3f75798ae6166891f1"
	file_id = "b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu"
	ucare = Uploadcare.new(pubkey, pvtkey)
	file = ucare.file(file_id)
	file.info # Returns the files info hash
	file.keep # Returns the updated info hash

## Example Info Hashes

### Preclaim Hash:
	
	{
		"upload_date"=>"2011-10-25 02:05:50",
		"last_keep_claim"=>nil,
		"on_s3"=>true,
		"url"=>"http://api.uploadcare.com/api/files/b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu/",
		"file_id"=>"b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu",
		"original_filename"=>"test-image.png",
		"original_file_url"=>nil
	}
	
### Postclaim Hash:
	
	{
		"upload_date"=>"2011-10-25 02:05:50",
		"last_keep_claim"=>"2011-10-25 02:19:06",
		"on_s3"=>true,
		"url"=>"http://api.uploadcare.com/api/files/b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu/",
		"file_id"=>"b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu",
		"original_filename"=>"test-image.png",
		"original_file_url"=>"http://s3.amazonaws.com/uploadcare/b6nn9f2d-1aj2-6q87-ofk0-265d8nki0diu/testimage.png"
	}

## Notes
All data in the examples (pubkey, pvtkey, file_id, example hashses) are intended to show usage and format. These values are randomly generated strings for this example and are therefore not valid. You must use your own public and private key, as well as a valid file id. Since the API is still very limited, thats about the extent of what you can do. Delete functionallity is forth coming (needs to be added to the API)