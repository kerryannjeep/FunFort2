class ApprovalsController < ApplicationController

  def confirm
    @message = Message.find(params[:id])
    @message.parent_approval = true
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
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
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
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
        format.html { redirect_to @message, notice: 'Message was deleted updated.' }
        format.json { head :no_content }
      else
        format.html { render action: current_user }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
