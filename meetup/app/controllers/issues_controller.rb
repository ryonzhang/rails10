class IssuesController < ApplicationController
  def show
     @issue = Issue.find(params[:id])
     @comments = @issue.comments
  end

  def new
    if not current_user
      flash[:notice]="没有执行此操作的权限，请先登入"
      redirect_to :root
      return
    else
      @issue = Issue.new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def create
    Issue.create(issue_params)
    redirect_to :root
  end

  def update
    i = Issue.find(params[:id])
    i.update_attributes(issue_params)
    redirect_to :root
  end

  def destroy
    i = Issue.find(params[:id])
    i.destroy
    redirect_to :root
  end

  private
    def issue_params
      params.require(:issue).permit(:title, :content, :user_id)
    end
end
