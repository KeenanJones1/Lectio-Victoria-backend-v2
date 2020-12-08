class ReadingListController < ApplicationController
  def index
    readinglists = ReadingList.all
    render json: readinglists.as_json(
      only: [:id, :name, :type]
    )
  end

  def create
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
