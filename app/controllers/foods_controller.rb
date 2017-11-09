class FoodsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :destroy]

    def index
            @foods = Food.all.order('created_at ASC')
                .paginate(page: params[:page], per_page: 6)
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        if @food.save
            @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture1])
            @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture2])
            @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture3])
            flash[:info] = "創造された成功"
            redirect_to :back
        else
            flash[:danger] = @food.errors.full_messages.join(" & ")
            redirect_to :back
        end
    end

    def show
        @food = Food.find_by(id: params[:id])
        if @food == nil
            not_found
        end
    end

    def update
        @food = Food.find(params[:id])
        if @food.update_attributes(food_params)
            if @food.food_pictures.count == 0
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture1])
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture2])
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture3])
            elsif @food.food_pictures.count == 1
                @food.food_pictures[0].update_attribute(:picture, picture_params[:picture1])
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture2])
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture3])
            elsif @food.food_pictures.count == 2
                @food.food_pictures[0].update_attribute(:picture, picture_params[:picture1])
                @food.food_pictures[1].update_attribute(:picture, picture_params[:picture2])
                @food_picture = FoodPicture.create(food_id: @food.id, picture: picture_params[:picture3])
            elsif @food.food_pictures.count == 3
                @food.food_pictures[0].update_attribute(:picture, picture_params[:picture1])
                @food.food_pictures[1].update_attribute(:picture, picture_params[:picture2])
                @food.food_pictures[2].update_attribute(:picture, picture_params[:picture3])
            end
            flash[:success] = "食べ物更新"
            redirect_to :back
        else
            redirect_to :back
        end
    end

    def destroy
        @food = Food.find(params[:id]).destroy
        flash[:success] = "Food deleted"

        if @food.destroy
            redirect_to root_path
        end
    end

    private
        def food_params
            params.require(:food).permit(:name, :price, :description, :store_id)
        end

        def picture_params
            params.require(:food).permit(:picture1, :picture2, :picture3)
        end
end
