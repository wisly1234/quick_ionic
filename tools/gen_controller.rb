require_relative 'table_help'
# require "table_help"


puts "check args:#{ARGV}"

folder, controller_name = ARGV

TEMEPLATE="
function #{controller_name}Ctrl($scope) {
	//Add your code here
}
"


File.open("#{folder}/js/app/#{controller_name}_controller.js", "w") do |f|
	f.write(TEMEPLATE)
end


File.open("#{folder}/js/wap/#{controller_name}_controller.js", "w") do |f|
	f.write(TEMEPLATE)
end

