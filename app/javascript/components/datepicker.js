import flatpickr from 'flatpickr';

const initDatepickers = () => {

  const startDateinput = document.getElementById('search_start_date');
  const endDateinput = document.getElementById('search_end_date');

  if (startDateinput && endDateinput) {
    console.log("Hello");
    flatpickr(startDateinput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
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
        dateFormat: 'd-m-Y',
      });
  }
}

export { initDatepickers }
