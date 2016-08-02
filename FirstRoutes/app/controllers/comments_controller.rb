class CommentsController < ApplicationController
  def index
    if params[:contact_id].nil?
      comment = User.find_by(id: params[:user_id]).comments
      render json: comment
    else
      comment = Contact.find_by(id: params[:contact_id]).comments
      render json: comment
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render( json: comment.errors.full_messages, status: :unprocessable_entity )
    end
  end


  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      render json: comment
    else
      render( json: comment.errors.full_messages, status: :unprocessable_entity )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :commentable_id, :commentable_type, :text)
  end

end
