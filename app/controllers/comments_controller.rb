class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    binding.pry
    @comment = @article.comments.create(comment_params)
    @comment.update(user_uuid: current_user.uuid)
    redirect_to article_path(@article.uuid)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article.uuid)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
