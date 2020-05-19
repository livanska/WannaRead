class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_book, only:[:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    def show
    end

    def new
        @book = Book.new
    end

    def create 
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book, success:'Book was created successfully'
        else
            flash.now[:danger] = 'Book was not created'
            render :new
        end
    end

    def edit
    end

    def update
        if @book.update_attributes(book_params)
            redirect_to @book, success:'Book was updated successfully'
        else 
            flash.now[:danger] = 'Book was not updated'
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path, success:'Book was deleted'
    end

    private 
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :summery, :body, :all_tags)
    end
end