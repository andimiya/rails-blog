class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@article), notice: "Comment was successfully created."
    else
      @comments = @article.comments.order(created_at: :asc)
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), notice: "Comment was successfully deleted."
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
