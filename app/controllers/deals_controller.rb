class DealsController < ApplicationController
  before_action :set_deal, only: %i[show]

  def index
    @deals = Deal.includes(:user).where(user: current_user).order(created_at: :desc)
    @total_deal = @deals.sum(:amount)
  end

  def new
    @deal = Deal.new
    @groups = current_user.groups.order(:name)
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    params = deal_params
    created_deal = Deal.new(name: params[:name], amount: params[:amount])
    created_deal.user = current_user
    created_deal.user_id = current_user.id

    if created_deal.save
      @group = Group.find(params[:group_id])
      created_deal.groups << @group
      flash[:notice] = 'deal created successfully.'
      redirect_to user_deals_path(current_user, created_deal)
    else
      flash[:error] = 'deal creation unsucessful!'
      @deal = created_deal
      render :new
    end
  end

  private

  def set_deal
    @deal = Deal.includes(:user).find(params[:id])
  end

  def deal_params
    params.require(:deal).permit(:name, :amount, :group_id)
  end
end
