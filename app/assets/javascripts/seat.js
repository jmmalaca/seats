function seat_click(seat) {
  if (seat.classList.contains('free')) {
    seat_number = seat.id.split('_', 2)[1];
    server_call (
      'POST',
      '/seats/' + seat_number +'/select.json',
      JSON.stringify({number: seat_number, status: 'selected'}),
    );
  } else if (seat.classList.contains('selected')) {
    seat_number = seat.id.split('_', 2)[1];
    server_call (
      'POST',
      '/seats/' + seat_number +'/deselect.json',
      JSON.stringify({number: seat_number, status: 'free'}),
    );
  }
}

function reservation_click() {
  $('.selected').each(function(_index) {
    var seat_number = $(this)[0].id.split('_', 2)[1];
    server_call (
      'PUT',
      '/seats/' + seat_number + '.json',
      JSON.stringify({number: seat_number, status: 'reserved'})
    );
  })
}

function server_call (http_verb, url, data) {
  $.ajax({
    type: http_verb,
    url: url,
    data: data,
    contentType: 'application/json',
    dataType: 'json',
    success: function(result) {
      $("#seat_" + result.number)[0].classList = '';
      $("#seat_" + result.number)[0].classList = 'dot ' + result.status;
    }
  });
}

window.addEventListener("beforeunload", function (_e) {
  var e = e || window.event ;

  // For Firefox and IE
  if  ( e )  {
    server_call ('DELETE', '/session/seats.json', JSON.stringify({}) );
  }

  // For Safari
  server_call ('DELETE', '/session/seats.json', JSON.stringify({}) );
});
