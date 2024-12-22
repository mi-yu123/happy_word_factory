class Admin::UnhappiesController < ApplicationController
  before_action :set_unhappy, only: [:edit, :update, :destroy]

  def index
    @unhappies = Unhappy.all
  end

  def new
    @unhappy = Unhappy.new
  end

  def create
    @unhappy = Unhappy.new(unhappy_params)
    if @unhappy.save
      redirect_to admin_dashboard_path, notice: "Unhappy Word が作成されました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @unhappy.update(unhappy_params)
      redirect_to admin_dashboard_path, notice: "Unhappy Word が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @unhappy.destroy
    redirect_to admin_dashboard_path, notice: 'Unhappy Word が削除されました'
  end

  private

  def set_unhappy
    @unhappy = Unhappy.find(params[:id])
  end

  def unhappy_params
    params.require(:unhappy).permit(:text)
  end
end
