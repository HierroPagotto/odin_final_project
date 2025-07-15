class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_follow_requests, class_name: 'FollowRequest', foreign_key: 'requester_id', dependent: :destroy
  has_many :received_follow_requests, class_name: 'FollowRequest', foreign_key: 'receiver_id', dependent: :destroy

  has_many :pending_followings, -> { where(status: 'pending') }, through: :sent_follow_requests, source: :receiver
  has_many :followers, -> { where(follow_requests: { status: 'accepted' }) }, through: :received_follow_requests, source: :requester, class_name: 'User'
  has_many :followings, -> { where(follow_requests: { status: 'accepted' }) }, through: :sent_follow_requests, source: :receiver, class_name: 'User'

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def send_follow_request_to(user)
    sent_follow_requests.create(receiver: user, status: 'pending') unless self == user || sent_follow_requests.exists?(receiver: user)
  end

  def accept_follow_request_from(user)
    req = received_follow_requests.find_by(requester: user, status: 'pending')
    req.update(status: 'accepted') if req
  end

  def reject_follow_request_from(user)
    req = received_follow_requests.find_by(requester: user, status: 'pending')
    req.destroy if req
  end

  def profile_image_url
    if profile_image.present?
      profile_image
    else
      gravatar_id = Digest::MD5::hexdigest(email.downcase)
      "https://www.gravatar.com/avatar/#{gravatar_id}?s=200&d=identicon"
    end
  end
end
