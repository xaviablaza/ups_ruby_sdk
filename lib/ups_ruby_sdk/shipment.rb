# frozen_string_literal: true

module UpsRubySdk
  class Shipment
    class << self
      def create(data, client:, token:)
        shipment = client.post(path, data, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})

        shipment_response = shipment.deep_transform_keys { |key| key.to_s.underscore }
        build shipment_response.with_indifferent_access
      end

      private

      def build(result)
        # shipment_response = result[:shipment_response]
        # response = shipment_response[:response]
        # shipment_results = shipment_response[:shipment_results]

        # # For success it's "1"
        # response_status_code = response_status[:code]
        # # For success it's "Success"
        # response_status_description = response_status[:description]

        # alert = response[:alert]
        # alert_code = alert[:code]
        # alert_description = alert[:description]

        # transaction_reference = response[:transaction_reference][:customer_context]

        # disclaimers = shipment_results[:disclaimer]

        # shipment_charges = shipment_results[:shipment_charges]
        # rate_chart = shipment_charges[:rate_chart]
        # base_service_charge = shipment_charges[:base_service_charge]
        # base_service_charge_value = base_service_charge[:monetary_value]
        # base_service_charge_currency = base_service_charge[:currency_code]
        # transportation_charges = shipment_charges[:transportation_charges]
        # transportation_charge_value = transportation_charges[:monetary_value]
        # transportation_charge_currency = transportation_charges[:currency_code]
        # itemized_charges = shipment_charges[:itemized_charges]
        # service_options_charge_value = shipment_charges[:service_options_charges][:monetary_value]
        # service_options_charge_currency = shipment_charges[:service_options_charges][:currency_code]
        # tax_charges = shipment_charges[:tax_charges]
        # total_charges = shipment_charges[:total_charges]
        # total_charges_with_taxes = shipment_charges[:total_charges_with_taxes]

        # negotiated_rate_charges = shipment_results[:negotiated_rate_charges]
        # negotiated_itemized_charges = negotiated_rate_charges[:itemized_charges]
        # negotiated_tax_charges = negotiated_rate_charges[:tax_charges]
        # negotiated_total_charge = negotiated_rate_charges[:total_charge]
        # negotiated_total_charge_currency = negotiated_total_charge[:currency_code]
        # negotiated_total_charge_value = negotiated_total_charge[:monetary_value]
        # negotiated_total_charges_with_taxes = negotiated_rate_charges[:total_charges_with_taxes]
        # negotiated_total_charges_with_taxes_currency = negotiated_total_charges_with_taxes[:currency_code]
        # negotiated_total_charges_with_taxes_value = negotiated_total_charges_with_taxes[:monetary_value]

        new(
          result
        )
      end

      def path
        "api/shipments/v2205/ship"
      end
    end
    def initialize(
      result
    )
      @result = result
    end
    attr_reader :result
  end
end
