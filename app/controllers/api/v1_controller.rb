class Api::V1Controller < ActionController::API
  rescue_from 'ActiveRecord::RecordNotFound' do
    error(["Resource can't be found"], 401)
  end

  private
    def success(object, status = 200)
      render json: success_format(object), status: status
    end

    def error(object, status = 400)
      render json: error_format(object), status: status
    end

    def success_format(object)
      {status: 'success', data: { object_root_name(object) => object }}
    end


    def error_format(errors)
      {status: 'fail', data: errors}
    end

    def object_root_name(object)
      if object.respond_to? :to_a
        object.model_name.plural
      else
        object.model_name.singular
      end
    end
end
