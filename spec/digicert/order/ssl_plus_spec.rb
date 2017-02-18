require "spec_helper"

RSpec.describe Digicert::Order::SSLPlus do
  describe ".create" do
    it "creates a new order for ssl plus certificate" do
      stub_digicert_order_create_api("ssl_plus", order_attributes)
      order = Digicert::Order::SSLPlus.create(order_attributes)

      expect(order.id).not_to be_nil
      expect(order.requests.first.id).not_to be_nil
      expect(order.requests.first.status).not_to be_nil
    end
  end

  def order_attributes
    {
      certificate: {
        organization_units: ["Developer Operations"],
        server_platform: { id: 45 },
        profile_option: "some_ssl_profile",

        # Required for certificate
        csr: "------ [CSR HERE] ------",
        common_name: "digicert.com",
        signature_hash: "sha256",
      },
      organization: { id: 117483 },
      validity_years: 3,
      custom_expiration_date: "2017-05-18",
      comments: "Comments for the the approver",
      disable_renewal_notifications: false,
      renewal_of_order_id: 314152,
      payment_method: "balance",
    }
  end
end
