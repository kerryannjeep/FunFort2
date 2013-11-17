class FriendshipsController  < ApplicationController
  before_filter :authorize

  def new
    @friendship = current_child.friendships.build()
  end

  def create
    @friendship = current_child.friendships.build(friendship_params)
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to current_child
    else
      flash[:error] = "Unable to add friend."
      redirect_to current_child
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_child
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end

end
