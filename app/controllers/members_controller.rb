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
    redirect '/map'
  end

  def map

  end

private

  def member_params
    params.require(:member).permit(:name, :year)
  end
end
