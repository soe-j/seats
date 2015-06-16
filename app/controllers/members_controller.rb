class MembersController < ApplicationController
  def index
    @member = Member.new
    @members = Member.all
  end

  def create
    Member.create(member_params)

    return redirect_to '/map' if params[:page] == 'map'

    redirect_to '/members'
  end

  def shuffle
    groups_num = params[:groups_num].to_i

    if groups_num == 0
      return redirect_to '/members', alert: 'wrong number of groups'
    end

    Group.delete_all
    Group.create_q(groups_num)
    Member.devide_groups(groups_num)

    redirect_to '/map'
  end

  def map
    @groups = Group.all
    @member = Member.new
  end

private

  def member_params
    params.require(:member).permit(:name, :year, :group_id)
  end
end
