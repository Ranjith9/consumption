require 'chef/knife'
require 'azure_mgmt_consumption'

module Engine
  module DengineAzureSdkConsumptionBase

      include Azure::Consumption::Mgmt::V2017_04_24_preview
      include Azure::Consumption::Mgmt::V2017_04_24_preview::Models

      def self.included(includer)
      includer.class_eval do

        def cost_client

          @cost_client ||= begin
            token_provider = MsRestAzure::ApplicationTokenProvider.new(Chef::Config[:knife][:azure_tenant_id], Chef::Config[:knife][:azure_client_id], Chef::Config[:knife][:azure_client_secret])
            credentials = MsRest::TokenCredentials.new(token_provider)
            cost_client = Azure::Consumption::Mgmt::V2017_04_24_preview::ConsumptionManagementClient.new(credentials)
          end
        @cost_client.subscription_id = Chef::Config[:knife][:azure_subscription_id]
        @cost_client
        end
        end
      end
    end
  end

