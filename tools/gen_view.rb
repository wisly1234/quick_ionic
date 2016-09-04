require_relative 'table_help'
# require "table_help"


puts "check args:#{ARGV}"

folder, view_name = ARGV

VIEW_TEMEPLATE="
<ion-view view-title=\"\" class=\"\">

</ion-view>
"  
save_str(VIEW_TEMEPLATE, "#{folder}/templates/app/#{view_name}.html")
save_str(VIEW_TEMEPLATE, "#{folder}/templates/wap/#{view_name}.html")



# controllers_str="var g_controller = angular.module('starter.views', []);\n"

views = read_to_hash("#{folder}/config/views.json")
views ||= []
views << view_name

# views.each do |one_controller|
# 	controllers_str += "document.write(\"<script src='js/app/#{one_controller}.html'></script>\");\n"
# end

# save_str(controllers_str, "#{folder}/templates/app/views.js")
# save_str(controllers_str, "#{folder}/templates/wap/views.js")
save_to_json(views, "#{folder}/config/views.json")