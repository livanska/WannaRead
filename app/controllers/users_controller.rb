class UsersController < ApplicationController
       # @user = User.find(params[:id])
      # @books = Book.where(:user_id => current_user.id)
    def user_posts
        @user = User.find(params[:user_id])
        @books = @user.books
       
        #render plain: {posts: @posts.inspect, user: @user.inspect} 
    end

  
end