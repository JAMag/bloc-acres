class CommentsController < ApplicationController

  before_action :find_property
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @property.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save


    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end


  def destroy
    @comment.destroy
    redirect_to :back
  end

  private

  def find_property
    @property = Property.find(params[:property_id])
  end

  def find_comment
    @comment = @property.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @property.user_id
      flash[:notice] = "You shall not pass!"
      redirect_to :back

    end
  end

end
