class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:show, :create]
  before_action :set_widget



  def index
    @messages = current_user.messages.order(created_at: :desc)
      respond_to do |format|
        format.html { @messages }
        format.csv { send_data(Message.to_csv(@messages), filename: "messages.csv") }
      end
  end

  def create
    @widget.messages.create!(message_params)
    head :ok
  end

  private

  def set_widget
    @widget = Widget.find_by(client_id: params[:client_id])
    @widget = Widget.last
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
