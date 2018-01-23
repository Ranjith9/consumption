require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_consumption_base"


module Engine
  class DengineAzureSdkCostList < Chef::Knife

    include DengineAzureSdkConsumptionBase

    banner "knife dengine azure sdk cost list (options)"

      def run
        $filter = "OfferDurableId eq 'MS-AZR-0017P' and Currency eq 'INR' and Locale eq 'en-US' and RegionInfo eq 'IN Central'"
        billing = '01/12/2017-01/01/2018'
        promise = cost_client.usage_details.list("/subscriptions/#{Chef::Config[:knife][:azure_subscription_id]}/providers/Microsoft.Billing/billingPeriods/#{billing}", expand = true, filter = $filter, skiptoken = nil, top = nil, custom_headers = nil)
#        promise = cost_client.operations.list(custom_headers = nil)
        puts promise
      end

  end
end

