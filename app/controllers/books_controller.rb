class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_book, only:[:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]



    def index
       @books = Book.paginate(page: params[:page],per_page: 6)

    end

    def show
    end

    def new
        @book = Book.new
    end

    def create 
        @book = Book.new(book_params.merge(user_id: current_user.id))
        @book.user = current_user
        if @book.save
            flash.now[:success] = 'Book was created successfully'
            render :show
        else
            flash.now[:danger] = 'Book was not created'
            render :new
        end
    end

    def edit
    end
    
    def update       
        if @book.update_attributes(book_params)
            flash.now[:success] = 'Book was updated successfully'
            render :show
        else 
            flash.now[:danger] = 'Book was not updated'
            render :edit
        end

    end

    def destroy
        @book.destroy
        flash.now[:success] = 'Book was updated successfully'
        render books_path
        #redirect_to books_path, success:'Book was deleted'
    end
    
    def user_books
        @books = current_user.books.all.order(created_at: 'DESC').paginate(page: params[:page],per_page: 6)
        render :user_books
    end

    private 
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :summery, :body, :all_tags)
    end

    def correct_user
        redirect_to root_path, notice: 'You are not allowed to modify this book' unless current_user.id == @book.user_id
    end
end