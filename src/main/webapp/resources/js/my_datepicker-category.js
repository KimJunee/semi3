/**
 * Directory – Directory & Listing Bootstrap Theme v. 2.0.1
 * Homepage: https://themes.getbootstrap.com/product/directory-directory-listing-bootstrap-4-theme/
 * Copyright 2021, Bootstrapious - https://bootstrapious.com
 */

"use strict";

$(function() {
    initDate();

    var singleMonth = false;
    if ($(window).width() < 668) {
        singleMonth = true;
    }

    var dateRangeConfig = {
        autoClose: true,
        startDate: new Date(),
        selectForward: true,
        applyBtnClass: "btn btn-primary",
        container: ".datepicker-container",
        inline: true, 
        singleMonth: singleMonth,
        showDateFilter: function(time, date) {
            return (
                '<div style="padding:5px;">\
                            <span style="">' +
                date +
                "</span>\
                        </div>"
            );
        },
        customOpenAnimation: function(cb) {
            $(this).fadeIn(300, cb);
        },
        customCloseAnimation: function(cb) {
            $(this).fadeOut(300, cb);
        },

    };
    $("#start_form_dates").dateRangePicker(dateRangeConfig).bind('datepicker-change', function(obj) {
        var date1 = new Date(obj.date1);
        var date2 = new Date(obj.date2);
		
        $("#start_month").html(getMonthEn(date1.getMonth()));
        $("#start_date").html(date1.getDate());
        $("#start_day").html(getTodayLabel(date1.getDay()) + " check-in<br>3PM ~");

        $("#end_day").html(getTodayLabel(date2.getDay()) + " check-out<br>~ 12PM");
        $("#end_month").html(getMonthEn(date2.getMonth()));
        $("#end_date").html(date2.getDate());
    });

});

function initDate() {
    var date = new Date();

    var date1 = new Date(date);
    var date2 = new Date(date);

    $("#start_month").html(getMonthEn(date1.getMonth()));
    $("#start_date").html(date1.getDate());
    $("#start_day").html(getTodayLabel(date1.getDay()) + " check-in<br>3PM ~");

    $("#end_day").html(getTodayLabel(date2.getDay()) + " check-out<br>~ 12PM");
    $("#end_month").html(getMonthEn(date2.getMonth()));
    $("#end_date").html(date2.getDate());
}

function  getTodayLabel(day)  { 
    var  week  =  new  Array('일요일',  '월요일',  '화요일',  '수요일',  '목요일',  '금요일',  '토요일');           
    var  todayLabel  =  week[day];        
    return  todayLabel;
}

function getMonthEn(month) {
    var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
        "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ];
    return monthNames[month];
}