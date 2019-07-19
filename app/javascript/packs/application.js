import 'flatpickr/dist/flatpickr.css';
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import { initDatepickers } from '../components/datepicker';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initDatepickers();
