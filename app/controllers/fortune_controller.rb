class FortuneController < ApplicationController
  before_action :set_fortune, only: [:show]

  def index
    @fortunes = Fortune.all
    render json: @fortunes, status: :ok
  end

  def show
    render json: @fortune, status: :ok
  end

  def random
    @fortune = Fortune.all.sample
    render json: @fortune, status: :ok
  end

  def help
    render json: ["Readme:",
                  "/fortune/random: return a random fortune",
                  "/fortune/n: return the nth fortune"]
  end

  private

  def show_params
    params.permit(:fortune, :author)
  end

  def set_fortune
    @fortune = Fortune.find(params[:id])
  end


end
