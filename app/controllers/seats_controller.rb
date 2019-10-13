# frozen_string_literal: true

class SeatsController < ApplicationController
  before_action :set_seat, only: %i[select deselect update]

  def index
    @presenter = SeatsPresenter.new
  end

  def select
    @seat.status = Seat::SELECTED_STATUS
    broadcast_seat_data(@seat.number, @seat.status)
    respond_to do |format|
      format.json { render :show, status: :ok, location: @seat }
    end
  end

  def deselect
    @seat.status = Seat::FREE_STATUS
    broadcast_seat_data(@seat.number, @seat.status)
    respond_to do |format|
      format.json { render :show, status: :ok, location: @seat }
    end
  end

  def update
    respond_to do |format|
      if @seat.update(seat_params)
        broadcast_seat_data(@seat.number, @seat.status)
        format.json { render :show, status: :ok, location: @seat }
      else
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_seat
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:number, :status)
  end
end
