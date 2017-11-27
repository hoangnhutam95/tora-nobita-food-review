class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :destroy]
    def new
        @review = Review.new
    end

    def create
        tmp=review_params
        @food = Food.find_by(id: tmp[:food_id])
        @review=Review.find_by(user_id: tmp[:user_id],food_id: tmp[:food_id])
        if @review
            if (tmp[:point]=tmp[:point].to_i)>0
                if @review.update(point: tmp[:point],content: tmp[:content])
                    flash[:success] = "レビューが更新された。"
                else
                    flash[:danger] = "レビューが更新されない。"
                end
            else
                if @review.update(content: tmp[:content])
                    flash[:success] = "レビューが更新された。"
                else
                    flash[:danger] = "レビューが更新されない。"
                end
            end
        else
            
            tmp[:point]=tmp[:point].to_i
            @review = Review.new(tmp)
            if @review.save
                flash[:success] = "レビューが作成された。"
            else
                flash[:danger] = "レビューが作成されない。"               
            end
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update_attributes(review_params)
            flash[:success] = "レビューが更新された"
            redirect_to :back
        else
            redirect_to :back
        end
    end

    def destroy
        @review = Review.find(params[:id]).destroy

        if @review.destroy
            flash[:success] = "レビューが削除されました."
            redirect_to :back
        end
    end

    private

        def review_params
            params.require(:review).permit(:point, :content, :user_id, :food_id)
        end
end
