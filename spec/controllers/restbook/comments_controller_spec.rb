require 'spec_helper'

module Restbook
  describe CommentsController do
    render_views
    
    describe "GET 'index'" do
      before :each do
        dude = Factory(:comment)
        walter = Factory(:comment, author: "Walter", 
                                     body: "...when you find a stranger in the Alps?")
        donny = Factory(:comment, author: "Donny",
                                     body: "They were Nazis, dude?")
        @comments = [dude, walter, donny]
      end
      
      describe "HTML" do
        it "returns http success" do
          get :index
          response.should be_success
        end
      
        it "renders the correct template" do
          get :index
          response.should render_template("comments/index")
        end
      end
      
      describe "JSON" do
        it "returns http success" do
          get :index, format: :json
          response.should be_success
        end
        
        it "should render JSON" do
          get :index, format: :json
          response.content_type.should include("json")
        end
        
        it "renders the correct comments" do
          get :index, format: :json
          response.body.should == @comments.to_json
        end
      end
    end
    
    describe "GET 'show'" do 
      before :each do
        @comment = Factory(:comment)
      end
      
      describe "HTML" do
        it "returns http success" do
          get :show, :id => @comment
          response.should be_success
        end
      
        it "should get correct comment" do
          get :show, :id => @comment
          assigns(:comment).should == @comment
        end
      end
      
      describe "JSON" do
        before :each do
          @comment = Factory(:comment)
        end
        
        it "returns http success" do
          get :show, id: @comment, format: :json
          response.should be_success
        end
        
        it "should render JSON" do
          get :show, id: @comment, format: :json
          response.content_type.should include("json")
        end
      end
    end
    
    describe "POST 'create'" do
      describe "success" do
        before :each do
          @attr = { author: "The Dude", body: "The Dude abides." }
        end
      
        it "adds a new comment" do
          lambda do
            post :create, comment: @attr
          end.should change(Comment, :count).by(1)
        end
        
        it "should redirect to root" do
          post :create, comment: @attr
          response.should redirect_to(root_path)
        end
      end
      
      describe "failure" do
        before :each do
          @attr = { author: "Calvin Coolidge", body: "" }
        end
        
        it "should not add a new comment" do
          lambda do
            post :create, comment: @attr
          end.should_not change(Comment, :count)
        end
        
        it "should render the 'new' template" do
          post :create, comment: @attr
          response.should render_template(:new)
        end
      end
    end
  end
end
