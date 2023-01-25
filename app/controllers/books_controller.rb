class BooksController < ApplicationController
# 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # UserIDを取り出す
    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. トップ画面へリダイレクト
    redirect_to books_path(@book)
  end

  def index
     @book = Book.new
     @user = current_user
     @books = Book.all
  end

  def show
  end

  def edit
  end

  def update
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
