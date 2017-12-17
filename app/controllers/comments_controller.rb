class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to article_url(@article), notice: 'コメントを投稿しました'
    else
      render 'articles/show'
    end
  end

  def update
    if @comment.update(comment_parmas)
      redirect_to article_url(@comment.article), notice: 'コメントを編集しました'
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@comment.article), notice: 'コメントを削除しました'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(:content)
  end
end
