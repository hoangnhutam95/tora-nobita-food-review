class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update_food, :destroy]
end
