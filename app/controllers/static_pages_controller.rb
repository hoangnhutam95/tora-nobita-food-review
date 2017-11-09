class StaticPagesController < ApplicationController
    def home
        @foods = Food.all.order('created_at DESC')
                .paginate(page: params[:page], per_page: 20)
    end
end
