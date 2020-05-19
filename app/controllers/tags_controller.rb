class TagsController < ApplicationController
    def show
        @tag = Tag.find_by(name: params[:id])
        @tags = @tag.books
    end
end