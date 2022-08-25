class GroupsController < ApplicationController
  before_action :set_group_params, only: %i[show edit destroy]

  def index
    @groups = Group.includes(:user).where(user: current_user)
  end

  def show
    @deals = @group.deals
  end

  def new
    @group = Group.new
  end

  def create
    created_group = Group.new(group_params)
    created_group.user = current_user
    created_group.user_id = current_user.id

    if created_group.save
      flash[:notice] = 'group created successfully.'
      redirect_to user_groups_path(current_user, created_group)
    else
      flash[:error] = 'group create unsucessful!'
      @group = created_group
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to user_groups_path(current_user.id, @group), notice: "Successfully deleted #{@group.name}."
  end

  private

  def set_group_params
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
