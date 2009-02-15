puts "Copying Migration Files"

["db/migrate"].each do |migrate|
  src_dir = File.join(File.dirname(__FILE__), migrate)
  dest_dir = RAILS_ROOT
  FileUtils.cp_r(src_dir, dest_dir)      
end

puts "Files copied - Installation complete!"


puts "Copying Assets Files"

["public/stylesheets","public/javascripts"].each do |asset|
  src_dir = File.join(File.dirname(__FILE__), asset)
  dest_dir = File.join(RAILS_ROOT, 'public')
  FileUtils.cp_r(src_dir, dest_dir)      
end

puts "Files copied - Installation complete!"