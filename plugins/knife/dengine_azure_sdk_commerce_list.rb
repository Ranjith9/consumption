require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_commerce_base"


module Engine
  class DengineAzureSdkCommerceList < Chef::Knife

    include DengineAzureSdkCommerceBase

    banner "knife dengine azure sdk commerce list (options)"

     def run
      $filter = "OfferDurableId eq 'MS-AZR-0017P' and Currency eq 'INR' and Locale eq 'en-US' and RegionInfo eq 'IN Central'"
      promise = commerce_client.rate_card.get($filter, custom_headers = nil)
      n = promise.meters
      n.each do |a|
      puts a.meter_id
      puts a.meter_name
      puts a.meter_category
      puts a.meter_sub_category
      puts a.unit
      puts a.meter_tags
      puts a.meter_region
      puts a.meter_rates
      puts a.effective_date
      puts a.included_quantity
      puts "******************************@@@@@@@@**************************"
      puts "******************************@@@@@@@@**************************"
      end
    end
  end
end

