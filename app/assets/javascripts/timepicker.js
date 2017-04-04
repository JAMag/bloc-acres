$(document).ready(function() {

    $('.date-picker').each(function () {
        var $datepicker = $(this),
            cur_date = ($datepicker.data('date') ? moment($datepicker.data('date'), "YYMMD-hha") : moment());

       // Original isBooked (by John I believe)
       //function isBooked(cur_date) {
         //   console.log('In Is Booked, cur_date', cur_date.format('YYMMD-hha'));
          // if (cur_date.format('YYMMD-hha') == gon.booked_appointments[0]){
          //     return(true)
         //  } else{
          //     return (false)
         //  }
        //}


        function isBooked(cur_date)
        {
            console.log('In Is Booked, cur_date', cur_date.format('YYMMD-hha'));
            var count=gon.booked_appointments.length;
            for(var i=0;i<count;i++)
            {
                if(gon.has_slots[i]===cur_date.format('YYMMDD-hha')){return true;}
            }
            return false;
        }




        ////check to see if there is a slot available

        function hasSlots(cur_date)
        {
            var count=gon.has_slots.length;
            for(var i=0;i<count;i++)
            {
                if(gon.has_slots[i]===cur_date.format('YYMMDD-hha')){return true;}
            }
            return false;
        }



        function updateDisplay(cur_date) {

            $('#dateinput').val(cur_date);

            $datepicker.find('.date-container > .date > .text').text(cur_date.format('Do'));
            $datepicker.find('.date-container > .month > .text').text(cur_date.format('MMMM'));
            $datepicker.find('.date-container > .hour > .text').text(cur_date.format('h:00'));






            ////if current hours is booked, set CSS on the element to mark booked and replace booking button with 'already booked'
            if (isBooked(cur_date)) {
                $datepicker.find('.date-container > .hour').css({backgroundColor: "#f2bdb3"});
                console.log('Booked time:', $("."+cur_date.format('YYMMD-hha')));
                $(".timepicker_stripe").hide();
                $("."+cur_date.format('YYMMD-hha')).siblings().hide();
                $("."+cur_date.format('YYMMD-hha')).hide();
            } else if (hasSlots(cur_date)) {
                $datepicker.find('.date-container > .hour').css({backgroundColor: "#67bbeb" });
                console.log('form selector', $("."+cur_date.format('YYMMD-hha')));
                $(".timepicker_stripe").show();
                $("."+cur_date.format('YYMMD-hha')).siblings().hide();
                $("."+cur_date.format('YYMMD-hha')).show();
            }else{
                $datepicker.find('.date-container > .hour').css({backgroundColor: "#A1A3A3" });
                $(".timepicker_stripe").hide();
            }

            ////if current hours == slots set cc element on slot


            $datepicker.data('date', cur_date.format('YYMMD-hha'));

        }





        updateDisplay(moment());

        $datepicker.on('click', '[data-toggle="datepicker"]', function(event) {
            event.preventDefault();

            var cur_date = moment($(this).closest('.date-picker').data('date'), "YYMMD-hha"),
                type = ($(this).data('type') ? $(this).data('type') : "date"),
                method = ($(this).data('method') ? $(this).data('method') : "add"),
                amt = ($(this).data('amt') ? $(this).data('amt') : 1);

            if (method == "add") {
                var duration = moment.duration(1,type);
                console.log("duration is", duration);
                cur_date = cur_date.add(duration);
            }else if (method == "subtract") {
                cur_date = cur_date.subtract(1,type);
            }

            updateDisplay(cur_date);
        });

    });

});

