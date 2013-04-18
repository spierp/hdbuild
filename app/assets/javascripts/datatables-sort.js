$(document).ready(function() {
$.fn.dataTableExt.oSort['currency-asc'] = function (a, b) {
	'use strict';

	var x, y;

	/* Remove any commas (assumes that if present all strings will have a fixed number of d.p) */
	x = (a === "-" || a === "--" || a === '' || a.toLowerCase().replace('/', '') === 'na') ? -1 : a.replace(/,/g, "");
	y = (b === "-" || b === "--" || b === '' || b.toLowerCase().replace('/', '') === 'na') ? -1 : b.replace(/,/g, "");

	/* Remove the currency sign */
	if (typeof x === "string" && isNaN(x.substr(0, 1), 10)) {
		x = x.substring(1);
	}
	if (typeof y === "string" && isNaN(y.substr(0, 1), 10)) {
		y = y.substring(1);
	}

	/* Parse and return */
	x = parseFloat(x, 10);
	y = parseFloat(y, 10);

	return x - y;
};
});
$(document).ready(function() {
$.fn.dataTableExt.oSort['currency-desc'] = function (a, b) {
	'use strict';

	var x, y;

	/* Remove any commas (assumes that if present all strings will have a fixed number of d.p) */
	x = (a === "-" || a === "--" || a === '' || a.toLowerCase().replace('/', '') === 'na') ? -1 : a.replace(/,/g, "");
	y = (b === "-" || b === "--" || b === '' || b.toLowerCase().replace('/', '') === 'na') ? -1 : b.replace(/,/g, "");

	/* Remove the currency sign */
	if (typeof x === "string" && isNaN(x.substr(0, 1), 10)) {
		x = x.substring(1);
	}
	if (typeof y === "string" && isNaN(y.substr(0, 1), 10)) {
		y = y.substring(1);
	}

	/* Parse and return */
	x = parseFloat(x, 10);
	y = parseFloat(y, 10);

	return y - x;
};
});


$(document).ready(function() {
jQuery.fn.dataTableExt.oSort['numeric-comma-asc']  = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /,/, "." );
	var y = (b == "-") ? 0 : b.replace( /,/, "." );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['numeric-comma-desc'] = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /,/, "." );
	var y = (b == "-") ? 0 : b.replace( /,/, "." );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};
});


$(document).ready(function() {
jQuery.extend( jQuery.fn.dataTableExt.oSort, {
    "file-size-pre": function ( a ) {
        var x = a.substring(0,a.length - 2);
             
        var x_unit = (a.substring(a.length - 2, a.length) == "MB" ?
            1000 : (a.substring(a.length - 2, a.length) == "GB" ? 1000000 : 1));
          
        return parseInt( x * x_unit, 10 );
    },
 
    "file-size-asc": function ( a, b ) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },
 
    "file-size-desc": function ( a, b ) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    }
} );
});



$(document).ready(function() {
jQuery.extend( jQuery.fn.dataTableExt.oSort, {
   "datetime-us-pre": function ( a ) {
       var b = a.match(/(\d{1,2})\/(\d{1,2})\/(\d{2,4}) (\d{1,2}):(\d{1,2}) (am|pm|AM|PM|Am|Pm)/),
           month = b[1],
           day = b[2],
           year = b[3],
           hour = b[4],
           min = b[5],
           ap = b[6];
 
       if(hour == '12') hour = '0';
       if(ap == 'pm') hour = parseInt(hour, 10)+12;
 
       if(year.length == 2){
           if(parseInt(year, 10)<70) year = '20'+year;
           else year = '19'+year;
       }
       if(month.length == 1) month = '0'+month;
       if(day.length == 1) day = '0'+day;
       if(hour.length == 1) hour = '0'+hour;
       if(min.length == 1) min = '0'+min;
 
       var tt = year+month+day+hour+min;
       return  tt;
   },
   "datetime-us-asc": function ( a, b ) {
       return a - b;
   },
 
   "datetime-us-desc": function ( a, b ) {
       return b - a;
   }
});
 
jQuery.fn.dataTableExt.aTypes.unshift(
   function ( sData )
   {
       if (sData !== null && sData.match(/\d{1,2}\/\d{1,2}\/\d{2,4} \d{1,2}:\d{1,2} (am|pm|AM|PM|Am|Pm)/))
       {
 
           return 'datetime-us';
       }
       return null;
   }
);
});