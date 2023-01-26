class UsersController < ApplicationController

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
     @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
