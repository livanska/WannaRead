class TagsController < ApplicationController
    def index
        @tags= Book.all
 
     end
    def show
        @tag = Tag.find_by(name: params[:id])
        @tags =@tag.books
    end
end