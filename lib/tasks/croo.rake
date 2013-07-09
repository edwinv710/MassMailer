task :croo do
	FileUtils.mkdir("#{Rails.root}/tmp") unless File.exists?("#{Rails.root}/tmp")
end

