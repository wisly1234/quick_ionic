require_relative 'table_help'

puts "check init project args:#{ARGV}"

folder = ARGV[0]

folder_list = ["js/wap", "js/app", "templates/wap", "templates/app"]

folder_list.each do |single_folder|
  Dir.mkdir("#{folder}/#{single_folder}") unless  (File.exist?("#{folder}/#{single_folder}"))
end
 	
Dir.mkdir("#{folder}/config") unless  (File.exist?("#{folder}/config"))


save_to_json([], "#{folder}/config/controllers.json")
save_to_json([], "#{folder}/config/services.json")