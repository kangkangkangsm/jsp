<%-- <div class="container">
    <form action="updateA_result.jsp_result.jsp" method="get" target="_blank">
        <%@include file="db.jsp"%>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            String c_id = (String)request.getParameter("c_id");
            
            try {
                stmt = conn.createStatement();
                String querytext = "SELECT * FROM users WHERE user_id ='" + user_id + "'";
                rs = stmt.executeQuery(querytext);
                if(rs.next()){
            
	
                }
            } catch (SQLException ex) {
                out.println("SQLException : " + ex.getMessage());
            }
        %>
        
    </form>
</div>

<script>
function Back() {
    window.history.back();
} --%>