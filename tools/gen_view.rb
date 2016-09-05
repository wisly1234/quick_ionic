require_relative 'table_help'
# require "table_help"


puts "check args:#{ARGV}"

folder, view_name, controller_name = ARGV

VIEW_TEMEPLATE="
<ion-view view-title=\"\" class=\"\">

</ion-view>
"  
save_str(VIEW_TEMEPLATE, "#{folder}/templates/app/#{view_name}.html")
save_str(VIEW_TEMEPLATE, "#{folder}/templates/wap/#{view_name}.html")



# controllers_str="var g_controller = angular.module('starter.views', []);\n"
controller_name = view_name

views = read_to_hash("#{folder}/config/views.json")
views ||= []
views << {"name" => view_name, "controller" => controller_name}

save_to_json(views, "#{folder}/config/views.json")


router_header_str = "
app.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider

"

router_str ={
	"app" => router_header_str,
	"wap" => router_header_str,
}
views.each do |one_view|
	name = one_view["name"]
	controller = one_view["controller"]
	router_str.each do |key, value|
		value +=
		"  // Each tab has its own nav history stack:
		
		  .state('#{name}', {
		    url: '/#{name}',
		    views: {
		      '#{name}': {
		        templateUrl: 'templates/#{key}/#{name}.html',
		        controller: '#{controller}Ctrl'
		      }
		    }
		  }) \n"
		  router_str[key] = value		
	end
end

router_str.each do |key, value|
	router_str[key] = value + "\n })"
	save_str(router_str[key], "#{folder}/js/#{key}/router.js")
end