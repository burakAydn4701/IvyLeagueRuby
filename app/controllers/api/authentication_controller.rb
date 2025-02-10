module Api
  class AuthenticationController < BaseController
    def login
      # Find user by email or username
      user = User.find_by(email: login_params[:login]) ||
             User.find_by(username: login_params[:login])
      
      if user&.authenticate(login_params[:password])
        render json: { 
          user: user,
          message: 'Logged in successfully'
        }
      else
        render json: { error: 'Invalid login credentials' }, status: :unauthorized
      end
    end

    private

    def login_params
      params.require(:auth).permit(:login, :password)
    end
  end
end 