class BooksController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
# 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # UserIDを取り出す
    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 画面へリダイレクトし、フラッシュメッセージを表示させる
    flash[:notice] = "You have created book successfully."
    # 4. トップ画面へリダイレクト
    redirect_to book_path(@book)

    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end


  def index
     @book = Book.new
     @user = current_user
     @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end


end
