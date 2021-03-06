class DaysController < ApplicationController
    def index
        @days = Day.all
        #render json: @days
         render json: @days, include: [:logs, :marinelives]
    end

    def show
      @day = Day.find(params[:id])
      render json: @day, include: [:logs, :marinelives]

    end

    def create
      @day = Day.create(day_params)
      render json: @day
    end

    def update
        @day = Day.find(params[:id])
        if @day.update(day_params)
            render json: @day
        end
    end

#     # def create
#     #     @day = Day.create(day: params[:day])
#     #     #byebug
#     #     render json: @day
#     # end
#
#   def create
#
# #byebug
#     @day = Day.new(day_params)
# #byebug
#     if @day.save
#       render json: @day, status: :accepted
#     end
#   end
#
#     def show
#         @day = Day.find(params[:id])
#         #render json: @day
#         render json: @day
#
#     end
#
#     def update
#         @day = Day.find(params[:id])
#         if @day.update(day_params)
#             render json: @day
#         end
#     end
#

    private

    def day_params
      params.require(:day).permit(:title, :date, :logs_attributes => [:location, :current, :visibility, :depth], :marinelives_attributes => [:content] )
    end

# #    params.require(:day).permit(:title, :day, :location, :current, :visibility, :depth, :content, :day_id )


end
