class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user

        @rooms = Room.all
        @users = User.all_except(@current_user)
    end

    def show
        @current_user = current_user
        @single_room = Room.find(params[:id])
        @rooms = Room.all
        @users = User.all_except(@current_user)
        @room = Room.new
      
        render "index"
    end

    def create
        @room = Room.create(name: params["name"])
    end
end
