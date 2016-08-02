class GroupsController < ApplicationController

  def index
    group = User.find_by(id: params[:user_id]).groups
    group_members = group.map{|group| group.contacts}
    render json: [group, group_members]
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: group
    else
      render(json: group.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    group = Group.find_by(id: params[:id])
    if group.destroy
      render json: group
    else
      render(json: group.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def update
    group = Group.find_by(id: params[:id])
    if group.update(group_params)
      render json: group
    else
      render(json: group.errors.full_messages, status: :unprocessable_entity)
    end
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :group_name)
  end
end
