class TodolistsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    #1データを新規登録するためのインスタンス作成
    list=List.new(list_params)
    #2データをデータベースに保存するためのsaveメソッド実行
    list.save
    #3トップ画面へリダイレクト
    redirect_to'/top'
  end

    def index
      @lists = List.all
    end

    def show
      @list=List.find(params[:id])
    end


  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title,:body)
  end
end