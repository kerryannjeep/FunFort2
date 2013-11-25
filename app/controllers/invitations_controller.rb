class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def accept
    success = false
    @invitation = Invitation.find(:secret_code => invitation_params[:secret_code])
    if @invitation.nil?
      @invitation.assign_attributes({status: 'Accepted',friend_id: current_child.id})
      @friendships = Friendships.connect_children(@invitation.child, @invitation.friend)

      Invitation.transaction do
        @invitation.save
        @friendships.iterate!(method(:save))
        success = true
      end
    end

    respond_to do |format|
      if success
        format.html { redirect_to @invitation, notice: 'Invitation was successfully accepted.' }
      else
        format.html { redirect_to @invitation, notice: 'Error.' }
      end
    end
  end

  def index
    @invitations = Invitation.all
  end

  def show
  end

  def new
    @invitation = Invitation.new
  end

  def edit
  end

  def create
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: 'Invitation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invitation }
      else
        format.html { render action: 'new' }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end

  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:child_id, :secret_code, :expiry_date, :status, :message_id)
    end
end
