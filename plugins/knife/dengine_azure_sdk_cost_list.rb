require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_consumption_base"


module Engine
  class DengineAzureSdkCostList < Chef::Knife

    include DengineAzureSdkConsumptionBase

    banner "knife dengine azure sdk cost list (options)"

      def run
        promise = cost_client.usage_details.list("/subscriptions/#{Chef::Config[:knife][:azure_subscription_id]}/", expand = true, filter = nil, skiptoken = nil, top = nil, custom_headers = nil)
#        promise = cost_client.operations.list(custom_headers = nil)
        puts promise
      end

  end
end

