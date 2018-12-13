class FlowImageUploader < CarrierWave::Uploader::Base 
  include Cloudinary::CarrierWave
end