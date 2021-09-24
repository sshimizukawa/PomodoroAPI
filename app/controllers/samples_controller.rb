
class SamplesController < ApplicationController
    def show
        render json: {status: 'sample api'}
    end
end