//= require cable
//= require_self

(function() {
  App.seats = App.cable.subscriptions.create('SeatsChannel', {
    connected: () => {
      console.log('connected');
    },
    rejected: () => {
      console.log('rejected');
    },
    disconnected: () => {
      console.log('disconnected');
    },
    received: function(seat) {
        $("#seat_" + seat.number)[0].classList = '';
        $("#seat_" + seat.number)[0].classList = 'dot ' + seat.status;
    }
  });
}).call(this);
