class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = User.find(params[:receiver_id])
    current_user.send_follow_request_to(receiver)
    redirect_back fallback_location: users_path, notice: 'Solicitação de acompanhamento enviada.'
  end

  def accept
    requester = User.find(params[:requester_id])
    current_user.accept_follow_request_from(requester)
    redirect_back fallback_location: users_path, notice: 'Solicitação de acompanhamento aceita.'
  end

  def reject
    requester = User.find(params[:requester_id])
    current_user.reject_follow_request_from(requester)
    redirect_back fallback_location: users_path, notice: 'Solicitação de acompanhamento rejeitada.'
  end
end
