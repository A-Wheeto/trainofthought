class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user

        @rooms = Room.all
        @users = User.all_except(@current_user)
    end
end
