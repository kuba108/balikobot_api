module BalikobotApi
  class Client

    attr_reader :api_user, :api_secret, :api_url

    def initialize(api_user, api_secret, api_url, test_api = false)
      @api_user = api_user
      @api_secret = api_secret
      @api_url = api_url.last == '/' ? api_url[0..-2] : api_url
      @test_api = test_api
    end

    # Adds package/packages into group which will be picked up.
    def add(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/add"
      body = {
        data: data
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Accepts same params as method ADD. This method only checks input and not send data to transporter.
    def check(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/check"
      body = data
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Drops package/packages from group in which they were added by ADD method.
    # In body can be data for one package or array of multiple packages.
    def drop(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/drop"
      body = {
        data: data
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns all package/packages states in order in which it came from transporter.
    # Maximum packages count in one request is 4!
    def track(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/track"
      body = {
        data: data
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns last state of package/packages in number format and text comment.
    def track_status(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/trackstatus"
      body = {
        data: data
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns list of unsent packages.
    def overview(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/overview"
      body = {
        data: data
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns PDF with labels of one or multiple packages.
    def labels(transporter, package_ids)
      endpoint_url = "#{@api_url}/#{transporter}/labels"
      body = {
        package_ids: package_ids
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns complete information about package.
    def package(transporter, package_id)
      endpoint_url = "#{@api_url}/#{transporter}/package/#{package_id}"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

    # Returns complete information about package.
    def order(transporter, data)
      endpoint_url = "#{@api_url}/#{transporter}/labels"
      body = {
        package_ids: package_ids
      }
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url, body)
    end

    # Returns order information. When order_id is nil, returns information to the last order.
    def order_view(transporter, order_id = nil)
      endpoint_url = "#{@api_url}/#{transporter}/orderview/#{order_id}"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

    # Creates request for ordering pick up on point.
    # This service is supported only by DHL now.
    # Not implemented yet!
    def order_pickup(transporter, data)
      raise "Not implemented yet!"
    end

    # Returns list of transport services provided by specific transporter.
    # When null is returned in response, it means that no service_type
    # is required to fill in methods requiring service_type
    def services(transporter)
      endpoint_url = "#{@api_url}/#{transporter}/services"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

    # Returns list of names and IDs for possible manipulation units.
    # Only Geis cargo is supported.
    # Not implemented yet!
    def manipulation_units
      raise "Not implemented yet!"
    end

    # Returns list of points for specific services on which package/packages can be send.
    def branches(transporter, service_type = nil)
      endpoint_url = "#{@api_url}/#{transporter}/branches/#{service_type}"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

    # Same as method BRANCHES, only returns more information.
    # Not implemented yet!
    def full_branches
      raise "Not implemented yet!"
    end

    # Returns list of states in which it is possible to send package/packages.
    def countries_for_service(transporter)
      endpoint_url = "#{@api_url}/#{transporter}/countries4service"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

    # Returns list of ZIP codes (PSC) for specific services on which package/packages can be send.
    # Param country can be nil.
    def zip_codes(transporter, service_type, country = nil)
      endpoint_url = "#{@api_url}/#{transporter}/zipcodes/#{service_type}/#{country}"
      RequestMaker.new(@api_user, @api_secret).send_post_request(endpoint_url)
    end

  end
end