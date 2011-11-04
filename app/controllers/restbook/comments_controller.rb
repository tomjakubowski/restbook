module Restbook
  class CommentsController < ApplicationController
    def index
      respond_to do |format|
        format.html { @comments = Comment.find(:all, order: "created_at desc") }
        format.json do
          # preserve insertion order for JSON.
          @comments = Comment.find(:all)
          render :json => @comments
        end
      end
    end
    
    def new
      @comment = Comment.new
    end
    
    def show
      @comment = Comment.find(params[:id])
      respond_to do |format|
        format.html
        format.json { render :json => @comment }
      end
    end
    
    def create
      @comment = Comment.new(params[:comment])
      if @comment.save
        redirect_to root_path
      else
        render :new
      end
    end
  end
end
