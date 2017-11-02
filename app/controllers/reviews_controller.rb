class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :destroy]
    def new
        @review = Review.new
    end

    def create
        @food = Food.find_by(id: review_params[:food_id])
        @reivew = Review.new(review_params)
        if @reivew.save
            flash[:success] = "作成されたレビュー。"
            respond_to do |format|
                format.html {redirect_to :back}
                format.js
            end
        end
    end

    def destroy
        @review = Review.find(params[:id]).destroy

        if @review.destroy
            flash[:success] = "レビューは削除されました."
            redirect_to :back
        end
    end

    private

        def review_params
            params.require(:review).permit(:point, :content, :user_id, :food_id)
        end
end
