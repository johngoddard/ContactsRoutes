class UsersController < ApplicationController
  def index
    # render text: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.destroy
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def favorites
    favorite_contacts = User.find_by(id: params[:id]).contacts.where(favorite: true)
    # favorite_shared = User.find_by(id: 1).shared_contacts.joins("contact_shares").where("\"contact_shares\".favorite = :val", val: true)
    favorite_shares = User.find_by(id: params[:id]).contact_shares.where(favorite: true)
    favorite_shared = favorite_shares.map{|share| share.contact}

    render json: [favorite_contacts, favorite_shared]
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
