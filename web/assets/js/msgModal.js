let params = new URLSearchParams(location.search);
let msgTitle = params.get('msgTitle');
let msgDetail = params.get('msgDetail');
if(msgDetail){
    if(msgTitle){
        $("#msgModalTitle").text(msgTitle);
    }
    $("#msgModalDetail").text(msgDetail);
    $(window).on('load', function() {
        $('#msgModal').modal('show');
    });
} 

