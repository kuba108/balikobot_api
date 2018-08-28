module BalikobotApi
  class ResponseValidator

    def validate_response(response)
      unless response.response_status == 200
        # response.body.first.each do |response_item|
        #   response_item['errors']
        # end
        #raise "Error in progress!"
      end
    end

  end
end