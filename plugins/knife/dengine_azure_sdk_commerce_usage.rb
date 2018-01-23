require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_commerce_base"


module Engine
  class DengineAzureSdkCommerceUsage < Chef::Knife

    include DengineAzureSdkCommerceBase

    banner "knife dengine azure sdk commerce usage (options)"

      def run
        promise = commerce_client.usage_aggregates.list('01-12-2017', '01-01-2018', show_details = true, aggregation_granularity = 'Daily', continuation_token = nil, custom_headers = nil)

        n = promise
        n.each do |a|
        puts a.id
        puts a.name
        puts a.type
        puts a.subscription_id
        puts a.meter_id
        puts a.usage_start_time
        puts a.usage_end_time
        puts "#{a.quantity} #{a.unit} #{a.meter_name}"
        puts a.meter_category
        puts a.meter_sub_category
        puts a.meter_region
        puts a.info_fields.project
        puts a.instance_data
        puts "******************************@@@@@@@@**************************"
        puts "******************************@@@@@@@@**************************"
        end 	
      end
  end
end

