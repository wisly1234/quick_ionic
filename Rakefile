def site_path; "~/workspace/quick_ionic/tabs/www" end

desc "add all module data like  rake module_add[my_module] "
task :module_add, [:module_name] do |t, args|
  module_name = args[:module_name]
  puts "get module_name: #{module_name}, #{args}"
  Rake::Task["controller_add"].invoke(module_name)
  # gen = "game-config/#{module_name}.json-gen.rb"
  # ruby "-C. -Ilib/cocs #{gen} #{design_dir}/Database/#{module_name}.xls"
end

desc "add controller module like  rake controller_add[my_controller] "
task :controller_add, [:controller_name] do |t, args|
  controller_name = args[:controller_name]
  puts "get controller_name: #{controller_name}, #{args}"
  ruby "-C. tools/gen_controller.rb #{site_path} #{controller_name}"
end

desc "init basic app directory"
task :init do 
  ruby "-C. tools/init_project.rb #{site_path}"
end