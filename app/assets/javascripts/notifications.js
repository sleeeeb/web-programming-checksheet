$(function() {
  console.log("hi");

  setTimeout(
    "$('.flash-messages__show').removeClass('flash-messages__show')",
    1000
  );
  setTimeout("$('.flash-messages').empty()", 1500);
});
