class PictureUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "uploads/product"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
    "/images/" + [version_name, "default.png"].compact.join('_')
   end
end
