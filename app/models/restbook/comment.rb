module Restbook
  class Comment < ActiveRecord::Base
    attr_accessible :author, :body
    
    validates :author, presence: true, length: { maximum: 80 }
    validates :body, presence: true, length: { maximum: 1000 }
  end
end
