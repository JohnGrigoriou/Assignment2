$(document).ready(function() {
    $(".delete").click(function() {
       let id = $(this).attr('id');
       $('#approveDelete').attr('delete-link',id);
       $("#deleteModal").modal("show");
    });
});


