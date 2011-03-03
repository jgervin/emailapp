class Member < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Member'
  has_many :members, :foreign_key => 'parent_id'

  validates :email,
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  

  after_create :generate_permalink

  def title
    "Just signed up at Eviral"
  end

  def link
    "http://eviral.com/members/#{permalink}"
  end

  def facebook_link
    "http://www.facebook.com/sharer.php?u=#{link}&t=#{title}"
  end

  def twitter_link
    "http://twitter.com/home?status=#{title + " " + link}"
  end

  private

  def generate_permalink
    self[:permalink] = "testing"
  end
end
