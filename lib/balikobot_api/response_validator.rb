module BalikobotApi
  class ResponseValidator

    def validate_response(response)
      if (200..299).include?(response.response_status)
        true
      else
        raise "Error in progress!"
        # response.body.first.each do |response_item|
        #   response_item['errors']
        # end
      end
    end

  end
end