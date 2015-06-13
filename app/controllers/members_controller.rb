class MembersController < ApplicationController
  def index
    @member = Member.new
    @members = Member.all
  end

  def create
    Member.create(member_params)
    redirect_to '/members'
  end

  def shuffle
    groups_num = params[:groups_num].to_i

    if groups_num == 0
      return redirect_to '/members', alert: 'wrong number of groups'
    end

    Member.devide_groups(groups_num)

    redirect_to '/map'
  end

  def map
    @groups = Member.groups
  end

private

  def member_params
    params.require(:member).permit(:name, :year)
  end
end
