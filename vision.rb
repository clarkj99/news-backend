# Imports the Google Cloud client library
require "google/cloud/vision"
# Instantiates a client
image_annotator = Google::Cloud::Vision::ImageAnnotator.new

# The name of the image file to annotate
file_name = "https://o.aolcdn.com/images/dims?thumbnail=1200%2C630&quality=80&image_uri=https%3A%2F%2Fo.aolcdn.com%2Fimages%2Fdims%3Fcrop%3D1729%252C1080%252C90%252C0%26quality%3D85%26format%3Djpg%26resize%3D1600%252C999%26image_uri%3Dhttps%253A%252F%252Fs.yimg.com%252Fos%252Fcreatr-uploaded-images%252F2019-12%252F20cb7220-1512-11ea-9bfd-51b58d9298c3%26client%3Da1acac3e1b3290917d92%26signature%3D1bdbbda663fb4cef4295b8dcebd1fbeb3a6e413a&client=amp-blogside-v2&signature=adad53e0bd55b0e43ef35be696c88e77a72c83a2"

# Performs label detection on the image file
response = image_annotator.label_detection image: file_name
response.responses.each do |res|
  puts "Labels:"
  res.label_annotations.each do |label|
    puts label.description
  end
end
