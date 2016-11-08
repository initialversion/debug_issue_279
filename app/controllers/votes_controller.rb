class VotesController < ApplicationController
  before_action :current_user_must_be_vote_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_vote_user
    vote = Vote.find(params[:id])

    unless current_user == vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @votes = current_user.likes.page(params[:page])

    render("votes/index.html.erb")
  end

  def show
    @vote = Vote.find(params[:id])

    render("votes/show.html.erb")
  end

  def new
    @vote = Vote.new

    render("votes/new.html.erb")
  end

  def create
    @vote = Vote.new

    @vote.user_id = params[:user_id]
    @vote.photo_id = params[:photo_id]

    save_status = @vote.save

    if save_status == true
      redirect_to(:back, :notice => "Vote created successfully.")
    else
      render("votes/new.html.erb")
    end
  end

  def edit
    @vote = Vote.find(params[:id])

    render("votes/edit.html.erb")
  end

  def update
    @vote = Vote.find(params[:id])

    @vote.user_id = params[:user_id]
    @vote.photo_id = params[:photo_id]

    save_status = @vote.save

    if save_status == true
      redirect_to(:back, :notice => "Vote updated successfully.")
    else
      render("votes/edit.html.erb")
    end
  end

  def destroy
    @vote = Vote.find(params[:id])

    @vote.destroy

    redirect_to(:back, :notice => "Vote deleted.")
  end
end
