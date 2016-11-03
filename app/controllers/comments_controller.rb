class CommentsController < ApplicationController
  def show
  end
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    #redirect_to article_path(@article)
    respond_to do |format|
      format.html {redirect_to article_path(@article)}
      format.js   {}
    end
  end

  def destroy

    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    #redirect_to article_path(@article)
    respond_to do |format|
      format.html {redirect_to article_path(@article),notice: 'test'}
      format.json {head :no_content}
      format.js {render layout:false}
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end