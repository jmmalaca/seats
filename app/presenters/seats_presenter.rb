# frozen_string_literal: true

class SeatsPresenter
  TABLE_ROWS_DEFAULT = 20
  TABLE_ROW_COLUMNS_DEFAULT = 25

  def initialize
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
    (0..TABLE_ROWS_DEFAULT).map do |row|
      ['<tr>', *row_columns(row * TABLE_ROW_COLUMNS_DEFAULT), '</tr>'].join(' ')
    end
  end

  def row_columns(offset)
    Seat.ordered.batched(offset, TABLE_ROW_COLUMNS_DEFAULT).map do |seat|
      [
        '<td>',
        "<span id='seat_#{seat.number}' class='dot #{seat.status}'",
        "onclick='seat_click(this);'>#{seat.number}</span>",
        '</td>'
      ].join(' ')
    end
  end

  def seats_count
    Seat.all.size
  end
end
