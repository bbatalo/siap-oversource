class Post < ApplicationRecord
  has_many :labels

  def next
    Post.where('id > ?', id).first
  end

  def previous
    Post.where('id < ?', id).last
  end
end
