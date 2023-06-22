# frozen_string_literal: true

module UpsRubySdk
  class Rate
    class << self
      def create(data, client:, token:)
        rate = client.post(path, data, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})

        underscored_rates = rate.deep_transform_keys { |key| key.to_s.underscore }
        build underscored_rates.with_indifferent_access
      end

      private

      def build(result)
        rate_response = result[:rate_response]
        response = rate_response[:response]
        rated_shipment = rate_response[:rated_shipment]
        response_status = response[:response_status]

        # For success it's "1"
        response_status_code = response_status[:code]
        # For success it's "Success"
        response_status_description = response_status[:description]
        # Array of hashes with keys :code, :description
        # Code can be "110971"
        # Description can be "Your invoice may vary from the displayed reference
        # rates"
        alerts = response[:alert]
        # Identifier is a random string
        transaction_identifier = response[:transaction_reference][:transaction_identifier]

        service_code = rated_shipment[:service][:code]
        service_description = rated_shipment[:service][:description]
        alert_code = rated_shipment[:rated_shipment_alert][:code]
        alert_description = rated_shipment[:rated_shipment_alert][:description]
        billing_weight = rated_shipment[:billing_weight][:weight]
        billing_weight_unit = rated_shipment[:billing_weight][:unit_of_measurement][:code]
        billing_weight_unit_description = rated_shipment[:billing_weight][:unit_of_measurement][:description]
        transportation_charge_value = rated_shipment[:transportation_charges][:monetary_value]
        transportation_charge_currency = rated_shipment[:transportation_charges][:currency_code]
        base_service_charge_value = rated_shipment[:base_service_charge][:monetary_value]
        base_service_charge_currency = rated_shipment[:base_service_charge][:currency_code]
        service_options_charge_value = rated_shipment[:service_options_charges][:monetary_value]
        service_options_charge_currency = rated_shipment[:service_options_charges][:currency_code]
        total_charges_value = rated_shipment[:total_charges][:monetary_value]
        total_charges_currency = rated_shipment[:total_charges][:currency_code]

        negotiated_charges = rated_shipment[:negotiated_charges]
        negotiated_base_service_charge_value = negotiated_charges[:base_service_charge][:monetary_value]
        negotiated_base_service_charge_currency = negotiated_charges[:base_service_charge][:currency_code]
        negotiated_transportation_charge_value = negotiated_charges[:transportation_charges][:monetary_value]
        negotiated_transportation_charge_currency = negotiated_charges[:transportation_charges][:currency_code]
        negotiated_service_options_charge_value = negotiated_charges[:service_options_charges][:monetary_value]
        negotiated_service_options_charge_currency = negotiated_charges[:service_options_charges][:currency_code]
        negotiated_total_charge_value = negotiated_charges[:total_charge][:monetary_value]
        negotiated_total_charge_currency = negotiated_charges[:total_charge][:currency_code]
        negotiated_itemized_charges = negotiated_charges[:itemized_charges]

        #        rated_package = rated_shipment[:rated_package]
        #        rated_package_transportation_charge_value = rated_package[:transportation_charges][:monetary_value]
        #        rated_package_transportation_charge_currency = rated_package[:transportation_charges][:currency_code]
        #        rated_package_base_service_charge_value = rated_package[:base_service_charge][:monetary_value]
        #        rated_package_base_service_charge_currency = rated_package[:base_service_charge][:currency_code]

        new(
          response_status_code,
          response_status_description,
          alerts,
          transaction_identifier,
          service_code,
          service_description,
          alert_code,
          alert_description,
          billing_weight,
          billing_weight_unit,
          billing_weight_unit_description,
          transportation_charge_value,
          transportation_charge_currency,
          base_service_charge_value,
          base_service_charge_currency,
          service_options_charge_value,
          service_options_charge_currency,
          total_charges_value,
          total_charges_currency,
          negotiated_base_service_charge_value,
          negotiated_base_service_charge_currency,
          negotiated_transportation_charge_value,
          negotiated_transportation_charge_currency,
          negotiated_service_options_charge_value,
          negotiated_service_options_charge_currency,
          negotiated_total_charge_value,
          negotiated_total_charge_currency,
          negotiated_itemized_charges
        )
      end

      def path
        "api/rating/v2205/Rate"
      end
    end
    def initialize(
      response_status_code,
      response_status_description,
      alerts,
      transaction_identifier,
      service_code,
      service_description,
      alert_code,
      alert_description,
      billing_weight,
      billing_weight_unit,
      billing_weight_unit_description,
      transportation_charge_value,
      transportation_charge_currency,
      base_service_charge_value,
      base_service_charge_currency,
      service_options_charge_value,
      service_options_charge_currency,
      total_charges_value,
      total_charges_currency,
      negotiated_base_service_charge_value=nil,
      negotiated_base_service_charge_currency=nil,
      negotiated_transportation_charge_value=nil,
      negotiated_transportation_charge_currency=nil,
      negotiated_service_options_charge_value=nil,
      negotiated_service_options_charge_currency=nil,
      negotiated_total_charge_value=nil,
      negotiated_total_charge_currency=nil,
      negotiated_itemized_charges=nil
    )
      @response_status_code = response_status_code
      @response_status_description = response_status_description 
      @alerts = alerts
      @transaction_identifier = transaction_identifier
      @service_code = service_code
      @service_description = service_description
      @alert_code = alert_code
      @alert_description = alert_description
      @billing_weight = billing_weight
      @billing_weight_unit = billing_weight_unit
      @billing_weight_unit_description = billing_weight_unit_description
      @transportation_charge_value = transportation_charge_value
      @transportation_charge_currency = transportation_charge_currency
      @base_service_charge_value = base_service_charge_value
      @base_service_charge_currency = base_service_charge_currency
      @service_options_charge_value = service_options_charge_value
      @service_options_charge_currency = service_options_charge_currency
      @total_charges_value = total_charges_value
      @total_charges_currency = total_charges_currency
      @negotiated_base_service_charge_value = negotiated_base_service_charge_value
      @negotiated_base_service_charge_currency = negotiated_base_service_charge_currency
      @negotiated_transportation_charge_value = negotiated_transportation_charge_value
      @negotiated_transportation_charge_currency = negotiated_transportation_charge_currency
      @negotiated_service_options_charge_value = negotiated_service_options_charge_value
      @negotiated_service_options_charge_currency = negotiated_service_options_charge_currency
      @negotiated_total_charge_value = negotiated_total_charge_value
      @negotiated_total_charge_currency = negotiated_total_charge_currency
      @negotiated_itemized_charges = negotiated_itemized_charges
    end
    attr_reader :response_status_code, \
      :response_status_description, \
      :alerts, \
      :transaction_identifier, \
      :service_code, \
      :service_description, \
      :alert_code, \
      :alert_description, \
      :billing_weight, \
      :billing_weight_unit, \
      :billing_weight_unit_description, \
      :transportation_charge_value, \
      :transportation_charge_currency, \
      :base_service_charge_value, \
      :base_service_charge_currency, \
      :service_options_charge_value, \
      :service_options_charge_currency, \
      :total_charges_value, \
      :total_charges_currency, \
      :negotiated_base_service_charge_value, \
      :negotiated_base_service_charge_currency, \
      :negotiated_transportation_charge_value, \
      :negotiated_transportation_charge_currency, \
      :negotiated_service_options_charge_value, \
      :negotiated_service_options_charge_currency, \
      :negotiated_total_charge_value, \
      :negotiated_total_charge_currency, \
      :negotiated_itemized_charges
  end
end
