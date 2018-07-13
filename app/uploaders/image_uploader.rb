class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [200, 200]
    # process resize_to_fill: [40, 40, gravity = ::Magick::CenterGravity]
  end

  # image resizing
  process convert: 'jpg'
  process resize_to_limit: [300, 200]

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def filename
    'article.jpg' if original_filename
  end
end
