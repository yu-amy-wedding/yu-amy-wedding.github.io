(function(){"use strict";angular.module("yuAmyWeddinggithubioApp",["ngUpload"])}).call(this),function(){angular.module("yuAmyWeddinggithubioApp").controller("FormCtrl",["$timeout","$anchorScroll","$window",function(a,b,c){var d,e,f,g,h,i,j;return j=this,h="yes",g="no but has gift",f="no",i="Yu",d="Amy",e="Both",j.init=function(){return j.name="",j.phone="",j.mayAttend=h,j.carnivoreCount=0,j.vegetarianCount=0,j.childSeatCount=0,j.email="",j.address="",j.friendOf=i,j.blessing="",j.hasNameError=!1,j.hasAttendeeCountError=!1,j.hasChildSeatCountError=!1},j.willAttend=function(){return j.mayAttend===h},j.getAttendeeCount=function(){return j.carnivoreCount+j.vegetarianCount},j.beforeSubmitForm=function(){var c,d,e;return e=0===j.name.length,c=j.willAttend()&&0===j.getAttendeeCount(),d=j.willAttend()&&j.childSeatCount>j.getAttendeeCount(),a(function(){var a;return a=null,(j.hasChildSeatCountError=d)&&(a="child-seat-form-group"),(j.hasAttendeeCountError=c)&&(a="attendee-form-group"),(j.hasNameError=e)&&(a="name-form-group"),a?b(a):void 0}),!e&&!c&&!d},j.onAttendStatusChanged=function(){return j.mayAttend!==h?j.carnivoreCount=j.vegetarianCount=j.childSeatCount=0:void 0},j.onSubmitForm=function(a){return c.alert("感謝你的回覆，你的心意我們收到了")},j.onSubmitFormError=function(a){return j.onSubmitForm()},j.init()}])}.call(this);