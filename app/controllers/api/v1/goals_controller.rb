class Api::V1::GoalsController < ApplicationController
  before_action :require_login
  def not_found
    render json: { error: 'not_found' }
  end
  def create
    goal = @user.goals.create(name:params[:name])
    if goal.save
      render json: { message: 'Goal created successfully' },
             status: :created
    else
      render json: { errors: goal.errors.full_messages },
             status: :bad_request
    end
  end
  def update
    goal = @user.goals.where(id:params[:id])&.first
    if goal.present?
       goal.update(name:params[:name])
       render json: { message: 'Goal updated successfully' },
              status: :created
    else
      render json: {status: 'Goal not found', code: 422}

    end
  end

end
