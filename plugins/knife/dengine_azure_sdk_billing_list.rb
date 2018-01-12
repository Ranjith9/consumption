require 'chef/knife'
require "#{File.dirname(__FILE__)}/base/dengine_azure_sdk_billing_base"


module Engine
  class DengineAzureSdkBillingList < Chef::Knife

    include DengineAzureSdkBillingBase

    banner "knife dengine azure sdk billing list (options)"

      def run
        promise = billing_client.operations.list(custom_headers = nil)
#        promise = billing_client.billing_periods.list(filter = nil, skiptoken = nil, top = nil, custom_headers = nil)
#        promise = billing_client.invoices.list(expand = nil, filter = nil, skiptoken = nil, top = nil, custom_headers = nil)
	puts promise[1].name
      end
  end
end
