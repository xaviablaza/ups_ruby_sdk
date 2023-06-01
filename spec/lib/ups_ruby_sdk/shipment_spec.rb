require "spec_helper"

RSpec.describe UpsRubySdk::Shipment do
  describe '.create' do
    before do
      UpsRubySdk.configure do |c|
        c.client_id = CONFIG[:client_id]
        c.client_secret = CONFIG[:client_secret]
      end
    end
    it "returns a Shipment object", vcr: { record: :once, match_requests_on: %i[method] } do
      client = UpsRubySdk::Client.new(test: true)
      data = {
        "ShipmentRequest": {
          "Request": {
            "SubVersion": "2205",
            "RequestOption": "nonvalidate",
            "TransactionReference": {
              "CustomerContext": ""
            }
          },
          "Shipment": {
            "Description": "Ship WS test",
            "Shipper": {
              "Name": "ShipperName",
              "AttentionName": "ShipperZs Attn Name",
              "TaxIdentificationNumber": "123456",
              "Phone": {
                "Number": "1115554758",
                "Extension": " "
              },
              "ShipperNumber": "AAAAAA",
              "FaxNumber": "8002222222",
              "Address": {
                "AddressLine": "2311 York Rd",
                "City": "Timonium",
                "StateProvinceCode": "MD",
                "PostalCode": "21093",
                "CountryCode": "US"
              }
            },
            "ShipTo": {
              "Name": "Happy Dog Pet Supply",
              "AttentionName": "1160b_74",
              "Phone": {
                "Number": "9225377171"
              },
              "Address": {
                "AddressLine": "123 Main St",
                "City": "timonium",
                "StateProvinceCode": "MD",
                "PostalCode": "21030",
                "CountryCode": "US"
              },
              "Residential": " "
            },
            "ShipFrom": {
              "Name": "T and T Designs",
              "AttentionName": "1160b_74",
              "Phone": {
                "Number": "1234567890"
              },
              "FaxNumber": "1234567890",
              "Address": {
                "AddressLine": "2311 York Rd",
                "City": "Alpharetta",
                "StateProvinceCode": "GA",
                "PostalCode": "30005",
                "CountryCode": "US"
              }
            },
            "PaymentInformation": {
              "ShipmentCharge": {
                "Type": "01",
                "BillShipper": {
                  "AccountNumber": "AAAAAA"
                }
              }
            },
            "Service": {
              "Code": "03",
              "Description": "Express"
            },
            "Package": {
              "Description": " ",
              "Packaging": {
                "Code": "02",
                "Description": "Nails"
              },
              "Dimensions": {
                "UnitOfMeasurement": {
                  "Code": "IN",
                  "Description": "Inches"
                },
                "Length": "10",
                "Width": "30",
                "Height": "45"
              },
              "PackageWeight": {
                "UnitOfMeasurement": {
                  "Code": "LBS",
                  "Description": "Pounds"
                },
                "Weight": "5"
              }
            }
          },
          "LabelSpecification": {
            "LabelImageFormat": {
              "Code": "EPL",
              "Description": "EPL"
            },
            "HTTPUserAgent": "Mozilla/4.5",
            "LabelStockSize": {
              "Width": "4",
              "Height": "6"
            }
          }
        }
      }

      shipment = described_class.create(data, client: client, token: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(shipment).to be_a(UpsRubySdk::Shipment)
    end
  end
end
