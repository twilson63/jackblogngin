namespace :jackblogngin do
  namespace :update do

    desc "Copies JackMigrations"
    task :migrations do
      ["db/migrate"].each do |migrate|
        src_dir = File.join(File.dirname(__FILE__), '..', migrate)
        dest_dir = File.join(RAILS_ROOT, "db")
        FileUtils.cp_r(src_dir, dest_dir)      
      end
    end

    desc "Copies Jack Assets the public directory"
    task :assets do
      ["public/stylesheets","public/javascripts"].each do |asset|
        src_dir = File.join(File.dirname(__FILE__), '..', asset)
        dest_dir = File.join(RAILS_ROOT, 'public')
        FileUtils.cp_r(src_dir, dest_dir)      
      end
      
    end

  end
  
	desc "Installs the JackMigrations"
	task :install do
		Rake::Task['jackblogngin:update:migrations'].invoke
		Rake::Task['jackblogngin:update:assets'].invoke
		
	end
  
end