module BalikobotApi
  class ResponseValidator

    def validate_response(response)
      unless (200..299).include?(response.response_status)
        # response.body.first.each do |response_item|
        #   response_item['errors']
        # end
        raise "Error in progress!"
      end
    end

  end
end