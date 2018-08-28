require "test_helper"

class BalikobotApiTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::BalikobotApi::VERSION
  end

  def test_add_method_with_valid_data
    data = [{
      eid: '2378273832273',
      order_number: '1',
      service_type: 'DR',
      cod_price: 12345.85,
      cod_currency: 'CZK',
      price: 12300,
      vs: 2736283920,
      rec_phone: '+420777555666',
      rec_name: 'John Carter',
      rec_street: 'Palackého 12',
      rec_city: 'Praha 9',
      rec_email: 'john@carter.com',
      rec_zip: '19000',
      rec_country: 'CZ',
      del_evening: true
    }]
    transporter = 'cp'
    client = BalikobotApi::Client.new('mixitczt', 'KNsfcmXD', 'https://api.balikobot.cz')
    response = client.check(transporter, data)
    assert_instance_of ::BalikobotApi::Response, response
  end

end
