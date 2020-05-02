class LogsController < ApplicationController
    def create
        @log = Log.create(log_params, day_id: params[:day][:id])
        render json: @log
    end

    def destroy
        log = Log.find_by(id: params[:id])
        log.destroy
        render json: log
    end

private
    def log_params
      params.require(:log).permit(:location, :current, :visibility, :depth)
    end
end