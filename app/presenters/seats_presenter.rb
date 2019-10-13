# frozen_string_literal: true

class SeatsPresenter
  TABLE_ROW_COLUMNS_DEFAULT = 25

  def initialize(session_id)
    @session_id = session_id
    @seats = RedisStore.read_all
    @rows_number = seats_count / TABLE_ROW_COLUMNS_DEFAULT
  end

  def any_seats?
    seats_count.positive?
  end

  def seats_table_html
    ['<table>', *table_html, '</table>'].join(' ').html_safe
  end

  private

  def table_html
    @seats.in_groups_of(TABLE_ROW_COLUMNS_DEFAULT).map do |seats|
      '<tr>' + seats.map do |seat|
        [
          '<td>',
          "<span id='seat_#{seat[:number]}'",
          "class='dot #{seat_selected(seat)}'",
          "onclick='seat_click(this);'>#{seat[:number]}</span>",
          '</td>'
        ].join(' ')
      end.join(' ') + '</tr>'
    end
  end

  def seat_selected(seat)
    return seat[:status] if seat[:user_token] == @session_id

    seat[:status] == Seat::SELECTED_STATUS ? 'selected_by_other' : seat[:status]
  end

  def seats_count
    @seats.size
  end
end
