Product.all.each do |product|
  begin
    product.picture.recreate_versions!
  rescue NoMethodError
    puts 'Error occured while recreating ProductPicture versions'
  end
end