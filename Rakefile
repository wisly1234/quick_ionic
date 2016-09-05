def site_path; "~/workspace/quick_ionic/tabs/www" end

desc "show help"
task :help do 
  puts "
  NOTICE: change the first line of Rakefile with your project folder
  1. rake init 
  --  init project folder
  2. rake module_add[my_module]
  -- add module to project 
  3. rake controller_add[my_controller]
  -- add controller to project
  4. rake view_add[my_view]
  -- add view to project
  "
end



desc "init basic app directory"
task :init do 
  ruby "-C. tools/init_project.rb #{site_path}"
end


desc "add all module data like  rake module_add[my_module] "
task :module_add, [:module_name] do |t, args|
  module_name = args[:module_name]
  puts "get module_name: #{module_name}, #{args}"
  Rake::Task["controller_add"].invoke(module_name)
  Rake::Task["view_add"].invoke(module_name)
  # gen = "game-config/#{module_name}.json-gen.rb"
  # ruby "-C. -Ilib/cocs #{gen} #{design_dir}/Database/#{module_name}.xls"
end


desc "add controller module like  rake controller_add[my_controller] "
task :controller_add, [:controller_name] do |t, args|
  controller_name = args[:controller_name]
  puts "get controller_name: #{controller_name}, #{args}"
  ruby "-C. tools/gen_controller.rb #{site_path} #{controller_name}"
end


desc "add view module like  rake view_add[my_view] "
task :view_add, [:view_name] do |t, args|
  view_name = args[:view_name]
  puts "get view_name: #{view_name}, #{args}"
  ruby "-C. tools/gen_view.rb #{site_path} #{view_name}"
end
