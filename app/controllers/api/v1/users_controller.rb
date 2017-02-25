class Api::V1::UsersController < Api::V1Controller
  before_action :find_user, except: [:index, :create]

  def index
    success(User.all)
  end

  def show
    success(@user)
  end

  def update
    # @user.update_attributes(user_params)
    # if @user.valid?
    #   success(@user)
    # else
    #   error(@user.errors)
    # end
    error([:not_implemented])
  end

  def create
    user = User.create(user_params)
    if user.valid?
      success(user)
    else
      error(user.errors)
    end
  end

  def delete
    error([:not_implemented])
  end

  private

    def user_params
      params.fetch(:user).permit(:email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
