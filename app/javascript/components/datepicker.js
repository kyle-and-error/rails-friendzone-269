import flatpickr from 'flatpickr';

const initDatepickers = () => {

  const startDateinput = document.getElementById('search_start_date');
  const endDateinput = document.getElementById('search_end_date');

  if (startDateinput && endDateinput) {
    console.log("Hello");
    flatpickr(startDateinput, {
    enableTime: true,
    minDate: 'today',
    dateFormat: 'd-m-YTh:m',
    onChange: function(_, selectedDate) {
      if (selectedDate === '') {
        return endDateinput.disabled = true;
      }
      endDateCalendar.set('minDate', selectedDate);
      endDateinput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateinput, {
        enableTime: true,
        dateFormat: 'd-m-YTh:m',
      });
  }
}

export { initDatepickers }
