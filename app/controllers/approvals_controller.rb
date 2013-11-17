class ApprovalsController < ApplicationController

  def thanks
  end

  def confirm
    @message = Message.find(params[:id])
    @message.parent_approval = true
    respond_to do |format|
      if @message.save
        MessageMailer.receive_approval_email(@message).deliver
        format.html { render action: 'thanks', notice: 'Message Approved.' }
        format.json { head :no_content }
      else
        format.html { render action: current_user }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_receipt
    @message = Message.find(params[:id])
    @message.friend_parent_approval = true
    respond_to do |format|
      if @message.save
        format.html { render action: 'thanks', notice: 'Message Approved.' }
        format.json { head :no_content }
      else
        format.html { render action: current_user }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.delete
        format.html { render action: "thanks", notice: 'Message Rejected.' }
        format.json { head :no_content }
      else
        format.html { render action: current_user }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
