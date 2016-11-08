class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :commented_photos,
             :through => :comments,
             :source => :photo

  has_many   :timeline,
             :through => :received_friend_requests,
             :source => :photos

  has_many   :liked_photos,
             :through => :likes,
             :source => :photo

  has_many   :follows,
             :through => :sent_friend_requests,
             :source => :recipient

  has_many   :followers,
             :through => :received_friend_requests,
             :source => :sender

  # Validations

  validates :bio, :length => { :maximum => 150 }

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :length => { :minimum => 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
