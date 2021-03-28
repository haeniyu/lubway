package com.web.lubway;

public class Test {
	public static void main(String[] args) {

		String[][] index = new String[3][3];
		
		for(int i=0; i<index.length; i++) {
			index[i][0] = "1800";
			index[i][1] = "1600";
			index[i][2] = null;
		}

		for(int i=0; i<index.length; i++) {
			for(int j=0; j<index[i].length; j++) {				
				System.out.println(index[i][j]);
			}
		}
	}
}
/*
<c:forEach var="변수1" items="${배열명1}" begin="0" end="${fn:length(배열명1)}" varStatus="status">

<c:set var="변수2" value="${배열명2[status.index]}"/>

</c:forEach>
*/