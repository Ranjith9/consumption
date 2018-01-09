require 'chef/knife'
require 'azure_mgmt_billing'

module Engine
  module DengineAzureSdkBillingBase

      include Azure::Billing::Mgmt::V2017_04_24_preview
      include Azure::Billing::Mgmt::V2017_04_24_preview::Models

      def self.included(includer)
      includer.class_eval do

        def billing_client

          @billing_client ||= begin
            token_provider = MsRestAzure::ApplicationTokenProvider.new(Chef::Config[:knife][:azure_tenant_id], Chef::Config[:knife][:azure_client_id], Chef::Config[:knife][:azure_client_secret])
            credentials = MsRest::TokenCredentials.new(token_provider)
            billing_client = BillingManagementClient.new(credentials)
          end
        @billing_client.subscription_id = Chef::Config[:knife][:azure_subscription_id]
        @billing_client
        end
        end
      end
    end
  end
