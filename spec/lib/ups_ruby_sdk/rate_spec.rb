require "spec_helper"

RSpec.describe UpsRubySdk::Rate do
  describe '.create' do
    before do
      UpsRubySdk.configure do |c|
        c.client_id = CONFIG[:client_id]
        c.client_secret = CONFIG[:client_secret]
      end
    end
    it "returns a Rate object", vcr: { record: :once, match_requests_on: %i[method] } do
      client = UpsRubySdk::Client.new(test: true)
      data = {
        "RateRequest": {
          "Request": {
            "TransactionReference": {
              "CustomerContext": "CustomerContext",
              "TransactionIdentifier": "TransactionIdentifier"
            }
          },
          "Shipment": {
            "Shipper": {
              "Name": "ShipperName",
              "ShipperNumber": "AAAAAA",
              "Address": {
                "AddressLine": [
                  "ShipperAddressLine",
                  "ShipperAddressLine",
                  "ShipperAddressLine"
                ],
                "City": "TIMONIUM",
                "StateProvinceCode": "MD",
                "PostalCode": "21093",
                "CountryCode": "US"
              }
            },
            "ShipTo": {
              "Name": "ShipToName",
              "Address": {
                "AddressLine": [
                  "ShipToAddressLine",
                  "ShipToAddressLine",
                  "ShipToAddressLine"
                ],
                "City": "Alpharetta",
                "StateProvinceCode": "GA",
                "PostalCode": "30005",
                "CountryCode": "US"
              }
            },
            "ShipFrom": {
              "Name": "ShipFromName",
              "Address": {
                "AddressLine": [
                  "ShipFromAddressLine",
                  "ShipFromAddressLine",
                  "ShipFromAddressLine"
                ],
                "City": "TIMONIUM",
                "StateProvinceCode": "MD",
                "PostalCode": "21093",
                "CountryCode": "US"
              }
            },
            "PaymentDetails": {
              "ShipmentCharge": {
                "Type": "01",
                "BillShipper": {
                  "AccountNumber": "AAAAAA"
                }
              }
            },
            "Service": {
              "Code": "03",
              "Description": "Ground"
            },
            "NumOfPieces": "1",
            "Package": {
              "SimpleRate": {
                "Description": "SimpleRateDescription",
                "Code": "XS"
              },
              "PackagingType": {
                "Code": "02",
                "Description": "Packaging"
              },
              "Dimensions": {
                "UnitOfMeasurement": {
                  "Code": "IN",
                  "Description": "Inches"
                },
                "Length": "5",
                "Width": "5",
                "Height": "5"
              },
              "PackageWeight": {
                "UnitOfMeasurement": {
                  "Code": "LBS",
                  "Description": "Pounds"
                },
                "Weight": "1"
              }
            }
          }
        }
      }

      rate = described_class.create(data, client: client, token: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(rate).to be_a(UpsRubySdk::Rate)
    end
  end
end
