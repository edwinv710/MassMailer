task :croo do
	FileUtils.mkdir("#{Rails.root}/tmp") unless File.exists?("#{Rails.root}/tmp")
	FileUtils.mkdir("#{Rails.root}/app/tmp") unless File.exists?("#{Rails.root}/app/tmp")
end

