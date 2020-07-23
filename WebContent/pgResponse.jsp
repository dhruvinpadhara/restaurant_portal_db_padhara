<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="paytm_java.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";

while(paramNames.hasMoreElements()) {
		String paramName = (String)paramNames.nextElement();
			if(paramName.equals("CHECKSUMHASH")){
				paytmChecksum = mapData.get(paramName)[0];
			}else{ 
				parameters.put(paramName,mapData.get(paramName)[0]);
			}
}

boolean isValideChecksum = false;
String outputHTML="";
String BANKNAME="";
String BANKTXNID ="";
String MID ="";
String ORDERID ="";
String PAYMENTMODE ="";
String RESPMSG ="";
String TXNAMOUNT ="";
String TXNDATE="";
String TXNID ="";


try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			BANKNAME = parameters.get("BANKNAME");
			BANKTXNID = parameters.get("BANKTXNID");
			
			MID = parameters.get("MID");
			ORDERID = parameters.get("ORDERID");
			
			PAYMENTMODE = parameters.get("PAYMENTMODE");
			RESPMSG = parameters.get("RESPMSG");
			
			TXNAMOUNT = parameters.get("TXNAMOUNT");
			TXNDATE = parameters.get("TXNDATE");
			TXNID = parameters.get("TXNID");
			
			out.print(BANKNAME+"\n"+BANKTXNID+"<br>"+MID+"<br>"+ORDERID+"<br>"+PAYMENTMODE+"<br>"+RESPMSG+"<br>"+TXNAMOUNT+"<br>"+TXNDATE+"<br>"+TXNID);
			outputHTML = parameters.toString();
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
<c:set var = "salary" scope = "session" value = "<%=outputHTML %>"/>

	<c:if test="${sessionScope.salary != 'Payment Failed.' }">	
		<form method="post" action="insert">
			<input type="hidden" name="i" value="23">
			<input type="hidden" name="BANKTXNID" value="<%=BANKTXNID %>">
			<input type="hidden" name="MID" value="<%=MID %>">
			<input type="hidden" name="ORDERID" value="<%=ORDERID %>">
			<input type="hidden" name="TXNAMOUNT" value="<%=TXNAMOUNT %>">
			<input type="hidden" name="TXNDATE" value="<%=TXNDATE %>">
			<input type="hidden" name="TXNID" value="<%=TXNID %>">
			<input type="submit" value="success">
		</form>
	</c:if>
</body>
</html>