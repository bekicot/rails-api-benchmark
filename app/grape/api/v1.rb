class Api::V1 < Grape::API
  format :json

  helpers do
    def success(object)
      { status: 'success', data: { object_name(object) => object } }
    end

    def error(object, status = 400)
      error!({ status: 'fail', data: object }, 400)
    end

    def object_name(object)
      if(object.respond_to? :to_a)
        object.model_name.singular
      else
        object.model_name.plural
      end
    end

  end

  mount Users => 'users'
end