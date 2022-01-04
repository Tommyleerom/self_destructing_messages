class MessagesController < ApplicationController
  before_action :set_message, only: %i[ destroy ]

  def index
    @messages = Message.all
  end

  def show
     @message = Message.find_by(auth_token: params[:auth_token])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to message_path(params[:auth_token]=@message.auth_token), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    MessageJob.set(wait: 1.minute).perform_later(@message)
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:auth_token])
    end

    def message_params
      params.require(:message).permit(:report, :password)
    end

end
