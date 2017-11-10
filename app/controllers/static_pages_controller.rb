class StaticPagesController < ApplicationController
    def home
        @foods = Food.all.order('created_at DESC')
            .paginate(page: params[:page], per_page: 20)
        @foodsRate =Food.all.joins(:reviews).group("foods.id").order("SUM(reviews.point)/COUNT(reviews.point) DESC")
            .paginate(page: params[:page], per_page: 20)
    end

    def search
        @foods = Food.search(params[:search]).order('name ASC')
            .paginate(page: params[:page], per_page: 20)
    end
end
