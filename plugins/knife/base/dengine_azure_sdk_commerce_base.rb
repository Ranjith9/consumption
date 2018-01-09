require 'chef/knife'
require 'azure_mgmt_commerce'

module Engine
  module DengineAzureSdkCommerceBase

      include Azure::Commerce::Mgmt::V2015_06_01_preview
      include Azure::Commerce::Mgmt::V2015_06_01_preview::Models

      def self.included(includer)
      includer.class_eval do

        def commerce_client

          @commerce_client ||= begin
            token_provider = MsRestAzure::ApplicationTokenProvider.new(Chef::Config[:knife][:azure_tenant_id], Chef::Config[:knife][:azure_client_id], Chef::Config[:knife][:azure_client_secret])
            credentials = MsRest::TokenCredentials.new(token_provider)
            commerce_client = UsageManagementClient.new(credentials)
          end
        @commerce_client.subscription_id = Chef::Config[:knife][:azure_subscription_id]
        @commerce_client
        end
        end
      end
    end
  end

