class Member < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Member'
  has_many :members, :foreign_key => 'parent_id'

  validates :email,
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  

  before_create :generate_permalink

  def title
    "Just signed up at SmackDab.com!"
  end

  def link
    "http://smackdab.com/t/#{permalink}"
  end

  def facebook_link
    "http://www.facebook.com/sharer.php?u=#{link}&t=#{title}"
  end

  def twitter_link
    "http://twitter.com/home?status=#{title + " " + link}"
  end

  private

  def generate_permalink
    o =  [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten;  
    self[:permalink] = (0..10).map{ o[rand(o.length)]  }.join;
  end
end
