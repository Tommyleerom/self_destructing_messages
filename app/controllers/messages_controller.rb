class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
     @message = Message.find_by(auth_token: params[:auth_token])
     @message.destroy if @message.lifetime < 1
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        MessageJob.set(wait: params[:time_to_delete].to_i.minutes).perform_later(@message)
        format.html { redirect_to message_path(params[:auth_token] = @message.auth_token), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:report, :password, :lifetime)
  end

end
