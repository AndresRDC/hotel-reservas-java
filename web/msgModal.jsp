<div id="msgModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">						
                    <h4 class="modal-title" id="msgModalTitle">Error</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <p id="msgModalDetail">No se pudo acceder</p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Aceptar">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    let msgDetail = null;
    let msgTitle = null;
    <% if(request.getSession().getAttribute("msgDetail") != null){ %>
        msgDetail = '<%=request.getSession().getAttribute("msgDetail")%>';
    <% } %> 
    <% if(request.getSession().getAttribute("msgTitle") != null){ %>
        msgTitle = '<%=request.getSession().getAttribute("msgTitle")%>';
    <% } %>
    <%
        request.getSession().removeAttribute("msgTitle");
        request.getSession().removeAttribute("msgDetail");
    %>
    if(msgDetail){
        if(msgTitle){
            $("#msgModalTitle").text(msgTitle);
        }
        $("#msgModalDetail").text(msgDetail);
        $(window).on('load', function() {
            $('#msgModal').modal('show');
        });
    }
</script>