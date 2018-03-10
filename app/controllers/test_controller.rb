class TestController < ApplicationController
  def get
    response = { message: "This is a response from the Rails API!" }
    json_response(response)
  end
end
