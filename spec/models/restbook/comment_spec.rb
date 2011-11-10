require 'spec_helper'

module Restbook
  describe Comment do
    before :each do
      @attr = {author: "The Dude", body: "The Dude abides." }
    end
    
    it "should create a new comment with valid attributes" do
      Comment.create!(@attr)
    end
    
    it "should require an author" do
      anonymous_comment = Comment.new(@attr.merge(author: ""))
      anonymous_comment.should_not be_valid
    end
    
    it "should require body text" do
      no_content_comment = Comment.new(@attr.merge(body: ""))
      no_content_comment.should_not be_valid
    end
    
    it "should reject author names which are too long" do
      nahasapeemapetilon = Comment.new(@attr.merge(author: "a" * 81))
      nahasapeemapetilon.should_not be_valid
    end
    
    it "should reject body text which is too long" do
      loremipsum = Comment.new(@attr.merge(body: "a" * 1001))
      loremipsum.should_not be_valid
    end
  end
end