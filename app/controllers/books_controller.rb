class BooksController < ApplicationController
  def top    
  end

  def index
    #全件取得
      @books = Book.all
      @book = Book.new

  end

  def show
    #指定したファイルを見つける
      @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params)
      #保存が成功した場合
      if @book.save
        flash[:notice] = 'Book was successfully created.'
         redirect_to @book
      #入力が正しくない場合
      else
         # redirect_to books_path
         @books = Book.all
         render :index
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
       @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "Book was successfully created."
         render 'show'
      else
         render 'edit'
      end
    
  end

  def destroy
      book = Book.find(params[:id])
      if book.destroy
         redirect_to books_path
      else
         redirect_to books_path
      end
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)    
  end

end
