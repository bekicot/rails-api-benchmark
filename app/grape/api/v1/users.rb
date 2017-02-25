class Api::V1::Users < Grape::API

  get do
    success(User.all)
  end

  params do
    requires :email
    requires :password
    requires :password_confirmation
  end
  post do
    user = User.create(declared(params, include_missing: false))
    if user.valid?
      success(user)
    else
      error(user.errors.full_messages)
    end
  end

  route_param :id do
    get do
      user = User.find(params[:id])
    end
  end
end