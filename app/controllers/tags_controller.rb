class TagsController < ApplicationController
    def index
        @tags= Book.all
 
     end
    def show
        @tag = Tag.find_by(name: params[:id])
        @tags =@tag.books.order(created_at: 'DESC').paginate(page: params[:page],per_page: 6)
    end
end