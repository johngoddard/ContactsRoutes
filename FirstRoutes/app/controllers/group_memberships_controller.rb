class GroupMembershipsController < ApplicationController
  def create
    membership = GroupMembership.new(group_membership_params)

    if membership.save
      render json: membership
    else
      render(json: membership.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def destroy
    membership = GroupMembership.find_by(id: params[:id])

    if membership.destroy
      render json: membership
    else
      render(json: membership.errors.full_messages, status: :unprocessable_entity )
    end
  end


  private

  def group_membership_params
    params.require(:group_membership).permit(:group_id, :contact_id)
  end
end
