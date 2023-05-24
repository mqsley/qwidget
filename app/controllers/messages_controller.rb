class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]
  before_action :set_widget, only: [:show]

  def create
    @widget.messages.create!(message_params)
    head :ok
  end

  def index
    @messages = current_user.messages.order(created_at: :desc)
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
